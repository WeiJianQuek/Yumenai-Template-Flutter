import 'package:flutter/material.dart';

import '../../../component/button/submit_button_component.dart';
import '../../../component/input/text_input_component.dart';
import '../../../component/template/screen_template_component.dart';
import '../../../component/view/image_view_component.dart';
import '../../../controller/app_controller.dart';
import '../../controller/entry/register_entry_controller_route.dart';

class RegisterEntryScreenRoute extends StatefulWidget {
  final RegisterEntryControllerRoute controller;

  const RegisterEntryScreenRoute({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<RegisterEntryScreenRoute> createState() => _RegisterEntryScreenRouteState();
}

class _RegisterEntryScreenRouteState extends State<RegisterEntryScreenRoute> {
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
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text('Organization'),
              TextInputComponent(
                label: 'Name',
                controller: widget.controller.organizationNameInputController,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text('User'),
              TextInputComponent(
                label: 'ID',
                controller: widget.controller.userIdInputController,
              ),
              TextInputComponent(
                label: 'Name',
                controller: widget.controller.userNameInputController,
              ),
              TextInputComponent.email(
                label: 'Email',
                controller: widget.controller.userEmailIdInputController,
              ),
              TextInputComponent.secure(
                label: 'Password',
                controller: widget.controller.userPasswordInputController,
              ),
              TextInputComponent.secure(
                label: 'Confirm Password',
                controller: widget.controller.userPasswordConfirmationInputController,
              ),
              const SizedBox(
                height: 24,
              ),
              SubmitButtonComponent(
                title: 'Sign Up',
                onClicked: () {
                  widget.controller.createAccount(this);
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
