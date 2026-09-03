import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/presentation/providers/ui_provider.dart';

import '../../data/datasources/todo_remote_data_source.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/todo/add_todo_usecase.dart';
import '../../domain/usecases/todo/delete_todo_usecase.dart';
import '../../domain/usecases/todo/get_todos_usecase.dart';
import '../../domain/usecases/todo/toggle_todo_usecase.dart';
import '../../domain/usecases/todo/update_todo_usecase.dart';
import 'auth_provider.dart';

final todoRemoteDataSourceProvider = Provider<TodoRemoteDataSource>((ref) {
  return TodoRemoteDataSourceImpl(ref.read(firestoreProvider));
});

final todoRepositoryProvider = Provider((ref) {
  return TodoRepositoryImpl(ref.read(todoRemoteDataSourceProvider));
});

final getTodosUseCaseProvider = Provider((ref) {
  return GetTodosUseCase(ref.read(todoRepositoryProvider));
});

final addTodoUseCaseProvider = Provider((ref) {
  return AddTodoUseCase(ref.read(todoRepositoryProvider));
});

final updateTodoUseCaseProvider = Provider((ref) {
  return UpdateTodoUseCase(ref.read(todoRepositoryProvider));
});

final deleteTodoUseCaseProvider = Provider((ref) {
  return DeleteTodoUseCase(ref.read(todoRepositoryProvider));
});

final toggleTodoUseCaseProvider = Provider((ref) {
  return ToggleTodoUseCase(ref.read(todoRepositoryProvider));
});

final todosProvider = StreamProvider<List<TodoEntity>>((ref) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return const Stream.empty();

  return ref.read(getTodosUseCaseProvider).call(user.uid);
});

final filteredTodosProvider = Provider<AsyncValue<List<TodoEntity>>>((ref) {
  final todosAsync = ref.watch(todosProvider);
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();

  return todosAsync.whenData((todos) {
    if (query.isEmpty) return todos;
    return todos.where((todo) {
      return todo.title.toLowerCase().contains(query) ||
          todo.description.toLowerCase().contains(query);
    }).toList();
  });
});

class TodoController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> addTodo(TodoEntity todo) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(addTodoUseCaseProvider).call(todo);
    });
  }

  Future<void> updateTodo(TodoEntity todo) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(updateTodoUseCaseProvider).call(todo);
    });
  }

  Future<void> deleteTodo({
    required String userId,
    required String todoId,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(deleteTodoUseCaseProvider)
          .call(userId: userId, todoId: todoId);
    });
  }

  Future<void> toggleTodo(TodoEntity todo) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(toggleTodoUseCaseProvider).call(todo);
    });
  }
}

final todoControllerProvider = AsyncNotifierProvider<TodoController, void>(
  TodoController.new,
);
