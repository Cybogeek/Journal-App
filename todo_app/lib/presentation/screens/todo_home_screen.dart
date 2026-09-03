import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/todo_entity.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';
import '../providers/todo_provider.dart';
import '../providers/ui_provider.dart';
import '../widgets/color_picker_dialog.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/error_view.dart';
import '../widgets/theme_toggle_tile.dart';
import '../widgets/todo_detail_sheet.dart';
import '../widgets/todo_item_card.dart';
import '../widgets/todo_list_shimmer.dart';
import 'add_edit_todo_screen.dart';

class TodoHomeScreen extends ConsumerStatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  ConsumerState<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends ConsumerState<TodoHomeScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: ref.read(searchQueryProvider),
    );
  }

  @override
  void dispose() {
    if (mounted && _searchController.text.isNotEmpty) {
      _searchController.dispose();
    }
    super.dispose();
  }

  void _showDetail(BuildContext context, TodoEntity todo) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => TodoDetailSheet(todo: todo),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todosAsync = ref.watch(filteredTodosProvider);
    final authUser = ref.watch(authStateProvider).value;
    final themeState = ref.watch(themeControllerProvider).value;
    final searchQuery = ref.watch(searchQueryProvider);

    if (_searchController.text != searchQuery) {
      _searchController.value = _searchController.value.copyWith(
        text: searchQuery,
        selection: TextSelection.collapsed(offset: searchQuery.length),
        composing: TextRange.empty,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todos'),
        actions: [
          ThemeToggleTile(
            isDark: themeState?.themeMode == ThemeMode.dark,
            onChanged: (value) {
              ref.read(themeControllerProvider.notifier).toggleDark(value);
            },
          ),
          IconButton(
            tooltip: 'Pick theme color',
            onPressed: () async {
              final selected = await showDialog<Color>(
                context: context,
                builder: (_) => ColorPickerDialog(
                  colors: AppConstants.themeColors,
                  selectedColor: themeState?.seedColor ?? Colors.deepPurple,
                ),
              );

              if (selected != null) {
                await ref
                    .read(themeControllerProvider.notifier)
                    .setSeedColor(selected);
              }
            },
            icon: Icon(
              Icons.palette_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'logout') {
                await ref.read(authControllerProvider.notifier).logout();
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Logout'), Icon(Icons.logout_rounded)],
                ),
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(todosProvider);
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 800;
            final padding = isWide ? 24.0 : 16.0;

            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(padding),
              children: [
                Text(
                  'Hello, ${authUser?.email ?? 'User'}',
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    ref.read(searchQueryProvider.notifier).setQuery(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search todos...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: searchQuery.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _searchController.clear();
                              ref.read(searchQueryProvider.notifier).clear();
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 16),
                todosAsync.when(
                  loading: () => const TodoListShimmer(),
                  error: (error, stack) => ErrorView(
                    message: error.toString(),
                    onRetry: () => ref.invalidate(todosProvider),
                  ),
                  data: (todos) {
                    if (todos.isEmpty) {
                      return const EmptyStateWidget();
                    }

                    return isWide
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: todos.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 1.5,
                                ),
                            itemBuilder: (context, index) {
                              final todo = todos[index];
                              return Dismissible(
                                key: ValueKey(todo.id),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                  ),
                                ),
                                onDismissed: (_) {
                                  ref
                                      .read(todoControllerProvider.notifier)
                                      .deleteTodo(
                                        userId: todo.userId,
                                        todoId: todo.id,
                                      );
                                },
                                child: TodoItemCard(
                                  todo: todo,
                                  onTap: () => _showDetail(context, todo),
                                  onToggle: () {
                                    ref
                                        .read(todoControllerProvider.notifier)
                                        .toggleTodo(todo);
                                  },
                                  onEdit: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            AddEditTodoScreen(todo: todo),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: todos.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 14),
                            itemBuilder: (context, index) {
                              final todo = todos[index];
                              return Dismissible(
                                key: ValueKey(todo.id),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                  ),
                                ),
                                onDismissed: (_) {
                                  ref
                                      .read(todoControllerProvider.notifier)
                                      .deleteTodo(
                                        userId: todo.userId,
                                        todoId: todo.id,
                                      );
                                },
                                child: TodoItemCard(
                                  todo: todo,
                                  onTap: () => _showDetail(context, todo),
                                  onToggle: () {
                                    ref
                                        .read(todoControllerProvider.notifier)
                                        .toggleTodo(todo);
                                  },
                                  onEdit: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            AddEditTodoScreen(todo: todo),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                  },
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEditTodoScreen()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Todo'),
      ),
    );
  }
}
