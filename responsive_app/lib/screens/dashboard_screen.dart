import 'package:flutter/material.dart';
import 'package:responsive_app/screens/components/buildfeature_section.dart';
import 'package:responsive_app/screens/components/buildhero_section.dart';
import 'package:responsive_app/screens/components/buildstats_section.dart';
import 'package:responsive_app/utils/responsive_helper.dart';
import 'package:responsive_app/widgets/dashboard_header.dart';

class DashboardScreen extends StatefulWidget {
  const new({super.key, required this.mediaSize});
  final Size mediaSize;
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.getScreenPadding(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardHeader(),
            const SizedBox(height: 24),
            BuildheroSection(mediaSize: widget.mediaSize),
            const SizedBox(height: 24),
            BuildstatsSection(),
            const SizedBox(height: 24),
            BuildfeatureSection(),
          ],
        ),
      ),
    );
  }
}
