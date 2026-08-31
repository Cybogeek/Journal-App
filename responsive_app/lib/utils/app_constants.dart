import 'package:flutter/material.dart';

class AppConstants {
  static const double mobileBreakpoint = 700;
  static const double tabletBreakpoint = 1024;

  static const EdgeInsets screenPaddingMobile = EdgeInsets.all(16);
  static const EdgeInsets screenPaddingTablet = EdgeInsets.all(24);
  static const EdgeInsets screenPaddingDesktop = EdgeInsets.all(32);

  static const Duration cardAnimationDuration = Duration(milliseconds: 500);

  static final List<Map<String, dynamic>> stats = [
    {
      'title': 'Revenue',
      'value': '\$24,800',
      'subtitle': '+12.4% this month',
      'icon': Icons.trending_up,
      'color': const Color(0xFF4F46E5),
    },
    const {
      'title': 'Users',
      'value': '18,240',
      'subtitle': '+8.1% this week',
      'icon': Icons.people_alt_outlined,
      'color': Color(0xFF06B6D4),
    },
    const {
      'title': 'Orders',
      'value': '1,284',
      'subtitle': '+5.6% today',
      'icon': Icons.shopping_bag_outlined,
      'color': Color(0xFF10B981),
    },
    const {
      'title': 'Feedback',
      'value': '426',
      'subtitle': '92% positive',
      'icon': Icons.star_border_rounded,
      'color': Color(0xFFF59E0B),
    },
  ];

  static const List<Map<String, String>> features = [
    {
      'title': 'Analytics Overview',
      'description': 'Track business metrics with an adaptive layout and smooth UI transitions.',
    },
    {
      'title': 'Team Performance',
      'description':
          'Monitor productivity, collaboration, and growth across all devices.',
    },
    {
      'title': 'Smart Notifications',
      'description':
          'Important updates are highlighted clearly with a scalable design.',
    },
    {
      'title': 'Responsive Experience',
      'description':
          'Optimized for phones, tablets, and large desktop-style displays.',
    },
  ];
}
