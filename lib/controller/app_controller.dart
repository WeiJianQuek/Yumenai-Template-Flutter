import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/resource/image_resource_data.dart';

class AppController extends ChangeNotifier {
  static AppController of(final BuildContext context, {
    final bool enableListener = true,
  }) {
    return Provider.of<AppController>(
      context,
      listen: enableListener,
    );
  }

  ThemeMode _themeMode;
  ImageResourceData _image;

  AppController()
      : _themeMode = ThemeMode.light,
        _image = const ImageResourceData.light();

  ThemeMode get themeMode => _themeMode;

  ImageResourceData get image => _image;

  bool isBrightnessDark(final BuildContext context) {
    if (_themeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    } else {
      return Theme.of(context).brightness == Brightness.dark;
    }
  }

  bool isBrightnessLight(final BuildContext context) {
    return !isBrightnessDark(context);
  }

  void updateTheme(final BuildContext context, final ThemeMode themeMode) {
    _themeMode = themeMode;

    updateBrightness(context);
  }

  void updateBrightness(final BuildContext context) {
    if (isBrightnessDark(context)) {
      _image = const ImageResourceData.dark();
    } else {
      _image = const ImageResourceData.light();
    }

    notifyListeners();
  }
}
