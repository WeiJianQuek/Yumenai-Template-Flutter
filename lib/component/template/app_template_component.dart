import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/app_controller.dart';

class AppTemplateComponent extends StatefulWidget {
  final Widget layout;

  const AppTemplateComponent({
    Key? key,
    required this.layout,
  }) : super(key: key);

  @override
  State<AppTemplateComponent> createState() => _AppTemplateComponentState();
}

class _AppTemplateComponentState extends State<AppTemplateComponent> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AppController();
          },
        ),
      ],
      child: MaterialApp(
        home: widget.layout,
      ),
    );
  }
}
