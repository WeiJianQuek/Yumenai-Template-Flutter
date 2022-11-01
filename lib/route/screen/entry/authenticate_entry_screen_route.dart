import 'package:flutter/material.dart';

import '../../../component/button/submit_button_component.dart';
import '../../../component/input/text_input_component.dart';
import '../../../component/template/screen_template_component.dart';
import '../../../component/view/image_view_component.dart';
import '../../../controller/app_controller.dart';
import '../../controller/entry/authenticate_entry_controller_route.dart';

class AuthenticateEntryScreenRoute extends StatefulWidget {
  final AuthenticateEntryControllerRoute controller;

  const AuthenticateEntryScreenRoute({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<AuthenticateEntryScreenRoute> createState() => _AuthenticateEntryScreenRouteState();
}

class _AuthenticateEntryScreenRouteState extends State<AuthenticateEntryScreenRoute> {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplateComponent.sheet(
      layout: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(24),
            physics: const ClampingScrollPhysics(),
            children: [
              Center(
                child: ImageViewComponent.asset(
                  path: AppController.of(context).image.appSplash,
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextInputComponent(
                label: 'ID',
                controller: widget.controller.idInputController,
              ),
              TextInputComponent.secure(
                label: 'Password',
                controller: widget.controller.passwordInputController,
              ),
              const SizedBox(
                height: 24,
              ),
              SubmitButtonComponent(
                title: 'Sign In',
                onClicked: () {
                  widget.controller.authenticateAccount(this);
                },
              ),
            ],
          ),
        ),
      ),
      navigatorBottom: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Powered by Yumenai',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
