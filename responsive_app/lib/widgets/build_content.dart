import 'package:flutter/material.dart';
import 'package:responsive_app/screens/dashboard_screen.dart';
import 'package:responsive_app/screens/report_screen.dart';
import 'package:responsive_app/screens/setting_screen.dart';

class BuildContents extends StatefulWidget {
  const new({super.key, required this.selectedIndex});

  final int selectedIndex;
  @override
  State<BuildContents> createState() => _BuildContentsState();
}

class _BuildContentsState extends State<BuildContents> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    switch (widget.selectedIndex) {
      case 0:
        return DashboardScreen(mediaSize: mediaSize);
      case 1:
        return ReportScreen();
      case 2:
        return SettingScreen();
      default:
        return DashboardScreen(mediaSize: mediaSize);
    }
  }
}
