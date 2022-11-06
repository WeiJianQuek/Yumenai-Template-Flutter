import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/template/app_template_component.dart';
import 'controller/app_controller.dart';
import 'controller/service_controller.dart';
import 'route/controller/entry/splash_entry_controller_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serviceController = await ServiceController.setup();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AppController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return serviceController;
          },
        ),
      ],
      child: AppTemplateComponent(
        layout: SplashEntryControllerRoute.screen(),
      ),
    ),
  );
}
