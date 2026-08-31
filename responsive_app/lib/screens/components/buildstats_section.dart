import 'package:flutter/material.dart';
import 'package:responsive_app/utils/app_constants.dart';
import 'package:responsive_app/utils/responsive_helper.dart';
import 'package:responsive_app/widgets/animated_stat_card.dart';

class BuildstatsSection extends StatefulWidget {
  const new({super.key});

  @override
  State<BuildstatsSection> createState() => _BuildstatsSectionState();
}

class _BuildstatsSectionState extends State<BuildstatsSection> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = ResponsiveHelper.getStatsGridCount(
          constraints.maxWidth,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: AppConstants.stats.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: constraints.maxWidth < 700 ? 1.5 : 1.25,
              ),
              itemBuilder: (context, index) {
                final item = AppConstants.stats[index];
                return AnimatedStatCard(
                  title: item['title'] as String,
                  value: item['value'] as String,
                  subtitle: item['subtitle'] as String,
                  icon: item['icon'] as IconData,
                  color: item['color'] as Color,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
