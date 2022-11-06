import 'package:flutter/material.dart';

import '../../../controller/app_controller.dart';
import '../../../controller/service_controller.dart';
import '../../../data/resource/language_resource_data.dart';
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

  String? themeModeTitle(final BuildContext context) {
    switch(AppController.listen(context).themeMode) {
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.system:
        return 'System';
    }
  }

  String languageTitle(final BuildContext context) {
    final languageCode = AppController.listen(context).locale?.languageCode;

    for (final info in LanguageResourceData.supportedInformationList.entries.toList()) {
      if (info.key == languageCode) {
        return info.value;
      }
    }

    return 'N/A';
  }

  void updateTheme(final State state) async {
    final int currentSelectedIndexPosition;

    switch(AppController.of(state.context).themeMode) {
      case ThemeMode.dark:
        currentSelectedIndexPosition = 0;
        break;
      case ThemeMode.light:
        currentSelectedIndexPosition = 1;
        break;
      case ThemeMode.system:
        currentSelectedIndexPosition = 2;
        break;
    }

    final result = await OptionDialogRoute.select(
      state.context,
      title: 'Select Theme',
      selectedIndexPosition: currentSelectedIndexPosition,
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

  void updateLanguage(final State state) async {
    final languageOptionList = <String> [];

    int? currentSelectedIndexPosition;

    for (int i = 0; i < LanguageResourceData.supportedInformationList.length; i++) {
      final info = LanguageResourceData.supportedInformationList.entries.elementAt(i);
      languageOptionList.add(info.value);

      if (AppController.of(state.context).locale?.languageCode == info.key) {
        currentSelectedIndexPosition = i;
      }
    }

    final result = await OptionDialogRoute.select(
      state.context,
      title: 'Select Language',
      selectedIndexPosition: currentSelectedIndexPosition,
      itemTitleList: languageOptionList,
    );

    if (!state.mounted) return;

    if (result == null) return;

    AppController.notify(state.context).updateLanguage(
      state.context,
      LanguageResourceData.supportedInformationList.entries.elementAt(result).key,
    );
  }
}
