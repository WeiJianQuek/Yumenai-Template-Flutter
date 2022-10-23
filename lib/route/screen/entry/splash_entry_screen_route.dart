import 'package:flutter/material.dart';

import '../../../component/template/screen_template_component.dart';
import '../../../component/view/image_view_component.dart';
import '../../../controller/app_controller.dart';
import '../../controller/entry/splash_entry_controller_route.dart';

class SplashEntryScreenRoute extends StatefulWidget {
  final SplashEntryControllerRoute controller;

  const SplashEntryScreenRoute({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<SplashEntryScreenRoute> createState() => _SplashEntryScreenRouteState();
}

class _SplashEntryScreenRouteState extends State<SplashEntryScreenRoute> {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplateComponent.sheet(
      layout: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: ImageViewComponent.asset(
                path: AppController.of(context).image.app.splash,
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
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Initializing...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const CircularProgressIndicator(),
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
