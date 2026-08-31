import 'package:flutter/material.dart';
import 'package:responsive_app/utils/app_constants.dart';
import 'package:responsive_app/utils/responsive_helper.dart';
import 'package:responsive_app/widgets/feature_card.dart';

class BuildfeatureSection extends StatefulWidget {
  const new({super.key});

  @override
  State<BuildfeatureSection> createState() => _BuildfeatureSectionState();
}

class _BuildfeatureSectionState extends State<BuildfeatureSection> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = ResponsiveHelper.getFeatureGridCount(
          constraints.maxWidth,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Features',
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
              itemCount: AppConstants.features.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: constraints.maxWidth < 700 ? 1.25 : 1.15,
              ),
              itemBuilder: (context, index) {
                final item = AppConstants.features[index];
                return FeatureCard(
                  title: item['title']!,
                  description: item['description']!,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
