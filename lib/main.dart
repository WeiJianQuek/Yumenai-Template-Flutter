import 'package:flutter/material.dart';

import 'component/template/app_template_component.dart';
import 'route/controller/entry/splash_entry_controller_route.dart';

void main() {
  runApp(
    AppTemplateComponent(
      layout: SplashEntryControllerRoute.screen(),
    ),
  );
}
