import 'package:flutter/material.dart';

import '../../../controller/app_controller.dart';
import '../../../controller/service_controller.dart';
import '../../../utility/navigator_utility.dart';
import '../../dialog/option_dialog_route.dart';
import '../../screen/dashboard/setting_dashboard_screen_route.dart';
import '../entry/splash_entry_controller_route.dart';

class SettingDashboardControllerRoute {
  static void navigate(final BuildContext context) {
    NavigatorUtility.screen.next(
      context,
      screen: const SettingDashboardScreenRoute(
        controller: SettingDashboardControllerRoute._(),
      ),
    );
  }

  const SettingDashboardControllerRoute._();

  String information(final BuildContext context) {
    return '${ServiceController.of(context).app.name}: ${ServiceController.of(context).app.version} (${ServiceController.of(context).app.code})';
  }

  void signOut(final BuildContext context) {
    SplashEntryControllerRoute.navigate(context);
  }

  String themeModeTitle(final BuildContext context) {
    switch(AppController.listen(context).themeMode) {
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.system:
        return 'System';
    }
  }

  void updateTheme(final State state) async {
    final int currentThemeModelIndexPosition;
    switch(AppController.of(state.context).themeMode) {
      case ThemeMode.dark:
        currentThemeModelIndexPosition = 0;
        break;
      case ThemeMode.light:
        currentThemeModelIndexPosition = 1;
        break;
      case ThemeMode.system:
        currentThemeModelIndexPosition = 2;
        break;
    }

    final result = await OptionDialogRoute.select(
      state.context,
      title: 'Select Theme',
      selectedIndexPosition: currentThemeModelIndexPosition,
      itemTitleList: [
        'Dark',
        'Light',
        'System',
      ],
    );

    if (!state.mounted) return;

    switch(result) {
      case 0:
        AppController.notify(state.context).updateTheme(state.context, ThemeMode.dark);
        break;
      case 1:
        AppController.notify(state.context).updateTheme(state.context, ThemeMode.light);
        break;
      case 2:
        AppController.notify(state.context).updateTheme(state.context, ThemeMode.system);
        break;
    }
  }
}
