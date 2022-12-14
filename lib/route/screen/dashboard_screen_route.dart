import 'package:flutter/material.dart';

import '../../component/template/screen_template_component.dart';
import '../../controller/app_controller.dart';
import '../controller/dashboard_controller_route.dart';

class DashboardScreenRoute extends StatelessWidget {
  final DashboardControllerRoute controller;

  const DashboardScreenRoute({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTemplateComponent(
      infoTitle: AppController.of(context).text(context)?.routeTitleDashboard ?? '',
      actionListRight: [
        IconButton(
          onPressed: () {
            controller.routeSettings(context);
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
