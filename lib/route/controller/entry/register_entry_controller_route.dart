import 'package:flutter/material.dart';

import '../../../service/navigator_service.dart';
import '../../screen/entry/register_entry_screen_route.dart';

class RegisterEntryControllerRoute {
  static void navigate(final BuildContext context) {
    NavigatorService.screen.next(
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

  }
}