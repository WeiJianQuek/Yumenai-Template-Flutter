import 'package:flutter/material.dart';

import '../../../service/navigator_service.dart';
import '../../screen/entry/splash_entry_screen_route.dart';

class SplashEntryControllerRoute {
  static Widget screen() {
    return const SplashEntryScreenRoute(
      controller: SplashEntryControllerRoute._(),
    );
  }

  static void navigate(final BuildContext context) {
    NavigatorService.screen.nextSession(
      context,
      screen: screen(),
    );
  }

  const SplashEntryControllerRoute._();

  void initialise(final State state) {

  }
}