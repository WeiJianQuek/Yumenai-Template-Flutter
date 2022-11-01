import 'package:flutter/material.dart';

import '../../service/navigator_service.dart';
import '../screen/dashboard_screen_route.dart';
import 'entry/splash_entry_controller_route.dart';

class DashboardControllerRoute {
  static void navigate(final BuildContext context) {
    NavigatorService.screen.nextSession(
      context,
      screen: DashboardScreenRoute(
        controller: DashboardControllerRoute._(),
      ),
    );
  }

  DashboardControllerRoute._();

  void signOut(final BuildContext context) {
    SplashEntryControllerRoute.navigate(context);
  }
}