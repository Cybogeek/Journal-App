import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/fruits_provider.dart';
import '../widgets/error_view.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/nutrition_chip.dart';

class FruitDetailScreen extends ConsumerWidget {
  final int fruitId;

  const FruitDetailScreen({super.key, required this.fruitId});

  Color _accent(int id) {
    final colors = [
      const Color(0xFFFFB74D),
      const Color(0xFF81C784),
      const Color(0xFF64B5F6),
      const Color(0xFFE57373),
      const Color(0xFFBA68C8),
    ];
    return colors[id % colors.length];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruitAsync = ref.watch(fruitByIdProvider(fruitId));

    return Scaffold(
      appBar: AppBar(title: const Text('Fruit Details')),
      body: fruitAsync.when(
        loading: () =>
            const Padding(padding: EdgeInsets.all(16), child: LoadingShimmer()),
        error: (error, stack) => ErrorView(
          message: 'Failed to load fruit details.\n$error',
          onRetry: () => ref.invalidate(fruitByIdProvider(fruitId)),
        ),
        data: (fruit) {
          final accent = _accent(fruit.id);

          return LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 700;
              final maxWidth = isWide ? 700.0 : double.infinity;

              return Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(18),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.9, end: 1),
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) {
                            return Transform.scale(scale: value, child: child);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  accent.withOpacity(0.95),
                                  accent.withOpacity(0.7),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: 'fruit_${fruit.id}',
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      width: 72,
                                      height: 72,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.18),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: const Icon(
                                        Icons.apple_rounded,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  fruit.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Family: ${fruit.family}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Order: ${fruit.order}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Genus: ${fruit.genus}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Nutrition Facts',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 14),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            NutritionChip(
                              label: 'Calories',
                              value: '${fruit.nutritions.calories}',
                              icon: Icons.local_fire_department,
                              color: Colors.orange,
                            ),
                            NutritionChip(
                              label: 'Fat',
                              value: '${fruit.nutritions.fat} g',
                              icon: Icons.water_drop,
                              color: Colors.red,
                            ),
                            NutritionChip(
                              label: 'Sugar',
                              value: '${fruit.nutritions.sugar} g',
                              icon: Icons.icecream,
                              color: Colors.pink,
                            ),
                            NutritionChip(
                              label: 'Carbs',
                              value: '${fruit.nutritions.carbohydrates} g',
                              icon: Icons.bakery_dining,
                              color: Colors.blue,
                            ),
                            NutritionChip(
                              label: 'Protein',
                              value: '${fruit.nutritions.protein} g',
                              icon: Icons.fitness_center,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
