import 'package:flutter/material.dart';

import '../../../service/navigator_service.dart';
import '../../screen/entry/landing_entry_screen_route.dart';
import 'register_entry_controller_route.dart';

class LandingEntryControllerRoute {
  static void navigate(final BuildContext context) {
    NavigatorService.screen.nextSession(
      context,
      screen: const LandingEntryScreenRoute(
        controller: LandingEntryControllerRoute._(),
      ),
    );
  }

  const LandingEntryControllerRoute._();

  void signIn(final State state) async {

  }

  void signUp(final State state) async {
    RegisterEntryControllerRoute.navigate(state.context);
  }
}
