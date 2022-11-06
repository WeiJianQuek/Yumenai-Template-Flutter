import 'package:flutter/material.dart';

import '../../../utility/navigator_utility.dart';
import '../../screen/entry/authenticate_entry_screen_route.dart';
import '../dashboard_controller_route.dart';

class AuthenticateEntryControllerRoute {
  static void navigate(final BuildContext context) {
    NavigatorUtility.screen.next(
      context,
      screen: AuthenticateEntryScreenRoute(
        controller: AuthenticateEntryControllerRoute._(),
      ),
    );
  }

  final idInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  AuthenticateEntryControllerRoute._();

  void authenticateAccount(final State state) async {
    DashboardControllerRoute.navigate(state.context);
  }
}
