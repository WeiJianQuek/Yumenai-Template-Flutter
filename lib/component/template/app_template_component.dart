import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../controller/app_controller.dart';
import '../../data/resource/color_resource_data.dart';

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
      AppController.updateBrightness(context);
    }

    super.didChangePlatformBrightness();
  }

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
      builder: (context, child) {
        const darkColorResource = ColorResourceData.dark();
        const lightColorResource = ColorResourceData.light();

        final SystemUiOverlayStyle systemUiOverlayStyle;

        if (AppController.of(context).isBrightnessDark(context)) {
          systemUiOverlayStyle = SystemUiOverlayStyle.dark.copyWith(
            systemNavigationBarColor: darkColorResource.system,
            systemNavigationBarDividerColor: darkColorResource.system,
            statusBarColor: darkColorResource.system,
          );
        } else {
          systemUiOverlayStyle = SystemUiOverlayStyle.light.copyWith(
            systemNavigationBarColor: lightColorResource.system,
            systemNavigationBarDividerColor: lightColorResource.system,
            statusBarColor: lightColorResource.system,
          );
        }

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiOverlayStyle,
          child: MaterialApp(
            title: 'Template',
            home: widget.layout,
            themeMode: AppController.of(context).themeMode,
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: lightColorResource.primary,
                onPrimary: lightColorResource.onPrimary,
                secondary: lightColorResource.secondary,
                onSecondary: lightColorResource.onSecondary,
                error: lightColorResource.error,
                onError: lightColorResource.onError,
                background: lightColorResource.background,
                onBackground: lightColorResource.onBackground,
                surface: lightColorResource.surface,
                onSurface: lightColorResource.onSurface,
              ),
            ),
            darkTheme: ThemeData.dark(
              useMaterial3: true,
            ).copyWith(
              colorScheme: ColorScheme(
                brightness: Brightness.dark,
                primary: darkColorResource.primary,
                onPrimary: darkColorResource.onPrimary,
                secondary: darkColorResource.secondary,
                onSecondary: darkColorResource.onSecondary,
                error: darkColorResource.error,
                onError: darkColorResource.onError,
                background: darkColorResource.background,
                onBackground: darkColorResource.onBackground,
                surface: darkColorResource.surface,
                onSurface: darkColorResource.onSurface,
              ),
            ),
          ),
        );
      },
    );
  }
}
