import 'package:flutter/material.dart';

import '../../../component/template/screen_template_component.dart';
import '../../controller/dashboard/setting_dashboard_controller_route.dart';

class SettingDashboardScreenRoute extends StatefulWidget {
  final SettingDashboardControllerRoute controller;

  const SettingDashboardScreenRoute({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<SettingDashboardScreenRoute> createState() => _SettingDashboardScreenRouteState();
}

class _SettingDashboardScreenRouteState extends State<SettingDashboardScreenRoute> {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplateComponent(
      infoTitle: 'Settings',
      actionListRight: [
        IconButton(
          onPressed: () {
            widget.controller.signOut(context);
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
      layout: ListView(
        children: [
          ListTile(
            leading: const SizedBox(
              width: 40,
              child: Center(
                child: Icon(Icons.person_outlined),
              ),
            ),
            title: const Text('Account'),
            subtitle: const Text('Profile'),
            onTap: () {

            },
          ),
          ListTile(
            leading: const SizedBox(
              width: 40,
              child: Center(
                child: Icon(Icons.brightness_6_outlined),
              ),
            ),
            title: const Text('Theme'),
            subtitle: Text(widget.controller.themeModeTitle(context)),
            onTap: () {
              widget.controller.updateTheme(this);
            },
          ),
          const Divider(
            height: 0.5,
          ),
          ListTile(
            leading: const SizedBox(
              width: 40,
              child: Center(
                child: Icon(Icons.translate),
              ),
            ),
            title: const Text('Language'),
            subtitle: const Text('English'),
            onTap: () {

            },
          ),
        ],
      ),
      navigatorBottom: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          widget.controller.information(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
