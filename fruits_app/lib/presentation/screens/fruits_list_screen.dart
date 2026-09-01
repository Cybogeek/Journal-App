import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruits_app/presentation/providers/theme_provider.dart';

import '../providers/fruits_provider.dart';
import '../widgets/error_view.dart';
import '../widgets/fruit_card.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/search_bar_widget.dart';
import 'fruit_detail_screen.dart';

class FruitsListScreen extends ConsumerWidget {
  const FruitsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruitsAsync = ref.watch(filteredFruitsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits Explorer'),
        actions: [
          Consumer(
            builder: (context, ref, _) {
              final themeMode = ref.watch(themeModeProvider);
              final notifier = ref.read(themeModeProvider.notifier);

              final isDark = themeMode == ThemeMode.dark;

              return IconButton(
                tooltip: isDark
                    ? 'Switch to light mode'
                    : 'Switch to dark mode',
                onPressed: notifier.toggleTheme,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: Icon(
                    isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    color: isDark ? Colors.amber : Colors.black38,
                    key: ValueKey(isDark),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 700;
          final isDesktop = constraints.maxWidth >= 1024;
          final horizontalPadding = isTablet ? 32.0 : 16.0;

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(allFruitsProvider);
              await ref.read(allFruitsProvider.future);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Discover fruits',
                    style: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Search and explore nutrition details of fresh fruits.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 18),
                  SearchBarWidget(
                    onChanged: (value) {
                      ref.read(searchQueryProvider.notifier).state = value;
                    },
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: fruitsAsync.when(
                      loading: () => LoadingShimmer(isGrid: isTablet),
                      error: (error, stack) => ErrorView(
                        message: 'Something went wrong.\n$error',
                        onRetry: () => ref.invalidate(allFruitsProvider),
                      ),
                      data: (fruits) {
                        if (fruits.isEmpty) {
                          return const Center(child: Text('No fruits found'));
                        }

                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: isTablet
                              ? GridView.builder(
                                  key: const ValueKey('grid'),
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: isDesktop ? 3 : 2,
                                        crossAxisSpacing: 14,
                                        mainAxisSpacing: 14,
                                        childAspectRatio: 2.4,
                                      ),
                                  itemCount: fruits.length,
                                  itemBuilder: (context, index) {
                                    final fruit = fruits[index];
                                    return TweenAnimationBuilder<double>(
                                      tween: Tween(begin: 0, end: 1),
                                      duration: Duration(
                                        milliseconds: 250 + (index * 40),
                                      ),
                                      builder: (context, value, child) {
                                        return Opacity(
                                          opacity: value,
                                          child: Transform.translate(
                                            offset: Offset(0, 20 * (1 - value)),
                                            child: child,
                                          ),
                                        );
                                      },
                                      child: FruitCard(
                                        fruit: fruit,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => FruitDetailScreen(
                                                fruitId: fruit.id,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                )
                              : ListView.separated(
                                  key: const ValueKey('list'),
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: fruits.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 12),
                                  itemBuilder: (context, index) {
                                    final fruit = fruits[index];
                                    return TweenAnimationBuilder<double>(
                                      tween: Tween(begin: 0, end: 1),
                                      duration: Duration(
                                        milliseconds: 250 + (index * 35),
                                      ),
                                      builder: (context, value, child) {
                                        return Opacity(
                                          opacity: value,
                                          child: Transform.translate(
                                            offset: Offset(0, 24 * (1 - value)),
                                            child: child,
                                          ),
                                        );
                                      },
                                      child: FruitCard(
                                        fruit: fruit,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => FruitDetailScreen(
                                                fruitId: fruit.id,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
