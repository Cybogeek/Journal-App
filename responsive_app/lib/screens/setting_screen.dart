import 'package:flutter/material.dart';
import 'package:responsive_app/utils/responsive_helper.dart';
import 'package:responsive_app/widgets/settings_tile.dart';

class SettingScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getScreenPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Manage your app preferences and account settings.',
            style: TextStyle(fontSize: 15, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 24),
          const SettingsTile(
            title: 'Notifications',
            subtitle: 'Manage push and email notifications',
          ),
          const SizedBox(height: 16),
          const SettingsTile(
            title: 'Appearance',
            subtitle: 'Theme, layout, and display settings',
          ),
          const SizedBox(height: 16),
          const SettingsTile(
            title: 'Privacy',
            subtitle: 'Control account privacy and security',
          ),
        ],
      ),
    );
  }
}
