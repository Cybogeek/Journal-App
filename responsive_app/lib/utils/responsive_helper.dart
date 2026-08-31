import 'package:flutter/material.dart';

import 'app_constants.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppConstants.mobileBreakpoint &&
        width < AppConstants.tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppConstants.tabletBreakpoint;
  }

  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isDesktop(context)) return AppConstants.screenPaddingDesktop;
    if (isTablet(context)) return AppConstants.screenPaddingTablet;
    return AppConstants.screenPaddingMobile;
  }

  static int getFeatureGridCount(double width) {
    if (width >= AppConstants.tabletBreakpoint) return 3;
    if (width >= AppConstants.mobileBreakpoint) return 2;
    return 1;
  }

  static int getStatsGridCount(double width) {
    if (width >= AppConstants.tabletBreakpoint) return 4;
    if (width >= AppConstants.mobileBreakpoint) return 2;
    return 1;
  }
}
