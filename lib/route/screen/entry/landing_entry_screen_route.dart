import 'package:flutter/material.dart';

import '../../../component/button/submit_button_component.dart';
import '../../../component/template/screen_template_component.dart';
import '../../../component/view/image_view_component.dart';
import '../../../controller/app_controller.dart';
import '../../controller/entry/landing_entry_controller_route.dart';

class LandingEntryScreenRoute extends StatefulWidget {
  final LandingEntryControllerRoute controller;

  const LandingEntryScreenRoute({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LandingEntryScreenRoute> createState() => _LandingEntryScreenRouteState();
}

class _LandingEntryScreenRouteState extends State<LandingEntryScreenRoute> {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplateComponent.sheet(
      layout: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ImageViewComponent.asset(
                path: AppController.of(context).image.appSplash,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Flutter Template',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'The goals of this application is to develop a template that ensure consistency and best coding practices for future flutter application.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SubmitButtonComponent(
              title: 'Sign In',
              onClicked: () {
                widget.controller.signIn(this);
              },
            ),
            const SizedBox(
              height: 12,
            ),
            SubmitButtonComponent.secondary(
              title: 'Sign Up',
              onClicked: () {
                widget.controller.signUp(this);
              },
            ),
          ],
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
