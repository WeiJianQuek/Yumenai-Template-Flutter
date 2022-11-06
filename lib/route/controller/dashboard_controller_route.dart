import 'package:flutter/material.dart';

import '../../utility/navigator_utility.dart';
import '../screen/dashboard_screen_route.dart';
import 'dashboard/setting_dashboard_controller_route.dart';

class DashboardControllerRoute {
  static void navigate(final BuildContext context) {
    NavigatorUtility.screen.nextSession(
      context,
      screen: DashboardScreenRoute(
        controller: DashboardControllerRoute._(),
      ),
    );
  }

  DashboardControllerRoute._();

  void routeSettings(final BuildContext context) {
    SettingDashboardControllerRoute.navigate(context);
  }
}
