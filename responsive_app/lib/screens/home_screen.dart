import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/build_content.dart';

import '../utils/responsive_helper.dart';
import '../widgets/adaptive_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Scaffold(
      body: SafeArea(
        child: isDesktop
            ? Row(
                children: [
                  AdaptiveNav(
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (index) {
                      setState(() => selectedIndex = index);
                    },
                  ),
                  const VerticalDivider(width: 1),
                  Expanded(child: BuildContents(selectedIndex: selectedIndex)),
                ],
              )
            : Column(
                children: [
                  Expanded(child: BuildContents(selectedIndex: selectedIndex)),
                ],
              ),
      ),
      bottomNavigationBar: isDesktop
          ? null
          : AdaptiveNav(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() => selectedIndex = index);
              },
            ),
    );
  }
}
