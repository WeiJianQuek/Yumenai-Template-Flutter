import 'package:flutter/material.dart';

import '../../../utility/navigator_utility.dart';
import '../../screen/entry/register_entry_screen_route.dart';
import '../dashboard_controller_route.dart';

class RegisterEntryControllerRoute {
  static void navigate(final BuildContext context) {
    NavigatorUtility.screen.next(
      context,
      screen: RegisterEntryScreenRoute(
        controller: RegisterEntryControllerRoute._(),
      ),
    );
  }

  final organizationNameInputController = TextEditingController();
  final userIdInputController = TextEditingController();
  final userNameInputController = TextEditingController();
  final userEmailIdInputController = TextEditingController();
  final userPasswordInputController = TextEditingController();
  final userPasswordConfirmationInputController = TextEditingController();

  RegisterEntryControllerRoute._();

  void createAccount(final State state) async {
    DashboardControllerRoute.navigate(state.context);
  }
}
