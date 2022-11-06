import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/resource/color_resource_data.dart';
import '../data/resource/image_resource_data.dart';

class AppController extends ChangeNotifier {
  static AppController of(final BuildContext context) {
    return Provider.of<AppController>(
      context,
      listen: false,
    );
  }

  static AppControllerNotify notify(final BuildContext context) {
    return AppControllerNotify(
      Provider.of<AppController>(
        context,
        listen: false,
      ),
    );
  }

  static AppController listen(final BuildContext context) {
    return Provider.of<AppController>(context);
  }

  ThemeMode _themeMode;
  ColorResourceData _color;
  ImageResourceData _image;

  AppController()
      : _themeMode = ThemeMode.light,
        _color = const ColorResourceData.light(),
        _image = const ImageResourceData.light();

  ThemeMode get themeMode => _themeMode;

  ColorResourceData get color => _color;

  ImageResourceData get image => _image;

  Brightness getBrightness(final BuildContext context) {
    if (_themeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness;
    } else {
      return Theme.of(context).brightness;
    }
  }

  bool isBrightnessDark(final BuildContext context) {
    if (_themeMode == ThemeMode.system) {
      return WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    } else {
      return _themeMode == ThemeMode.dark;
    }
  }

  bool isBrightnessLight(final BuildContext context) {
    return !isBrightnessDark(context);
  }

  void _updateTheme(final BuildContext context, final ThemeMode themeMode) {
    _themeMode = themeMode;

    _synchronizeBrightness(context);
  }

  void _synchronizeBrightness(final BuildContext context) {
    if (isBrightnessDark(context)) {
      _color = const ColorResourceData.dark();
      _image = const ImageResourceData.dark();
    } else {
      _color = const ColorResourceData.light();
      _image = const ImageResourceData.light();
    }

    notifyListeners();
  }
}

class AppControllerNotify {
  final AppController _controller;

  const AppControllerNotify(this._controller);

  void updateTheme(final BuildContext context, final ThemeMode themeMode) {
    _controller._updateTheme(context, themeMode);
  }

  void synchronizeBrightness(final BuildContext context) {
    _controller._synchronizeBrightness(context);
  }
}
