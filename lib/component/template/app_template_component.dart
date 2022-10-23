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

class _AppTemplateComponentState extends State<AppTemplateComponent> with WidgetsBindingObserver {
  final _appController = AppController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      _appController.updateBrightness(context);
    }

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return _appController;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Management',
        home: widget.layout,
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
