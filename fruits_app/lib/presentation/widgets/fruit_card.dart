import 'package:flutter/material.dart';

import '../../domain/entities/fruit_entity.dart';

class FruitCard extends StatelessWidget {
  final FruitEntity fruit;
  final VoidCallback onTap;

  const FruitCard({super.key, required this.fruit, required this.onTap});

  Color _getAccentColor(int id) {
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
  Widget build(BuildContext context) {
    final accent = _getAccentColor(fruit.id);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Hero(
                  tag: 'fruit_${fruit.id}',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(Icons.apple, color: accent, size: 30),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fruit.name,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${fruit.family} • ${fruit.genus}',
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 18, color: accent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
