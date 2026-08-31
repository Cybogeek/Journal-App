import 'package:flutter/material.dart';
import 'package:responsive_app/utils/responsive_helper.dart';
import 'package:responsive_app/widgets/simpleinfo_card.dart';

class ReportScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getScreenPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reports',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'A demo reports page with adaptive cards and summary blocks.',
            style: TextStyle(fontSize: 15, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = ResponsiveHelper.getFeatureGridCount(
                constraints.maxWidth,
              );

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: constraints.maxWidth < 700 ? 1.3 : 1.2,
                children: const [
                  SimpleinfoCard(
                    title: 'Weekly Sales',
                    value: '\$8,420',
                    subtitle: 'Strong growth this week',
                  ),
                  SimpleinfoCard(
                    title: 'Conversion Rate',
                    value: '4.8%',
                    subtitle: 'Improved from last month',
                  ),
                  SimpleinfoCard(
                    title: 'Active Campaigns',
                    value: '12',
                    subtitle: '3 launching soon',
                  ),
                  SimpleinfoCard(
                    title: 'Customer Retention',
                    value: '87%',
                    subtitle: 'Stable performance',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
