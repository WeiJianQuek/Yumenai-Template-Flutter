import 'package:flutter/material.dart';

class ColorResourceModel {
  final Color primary;
  final Color onPrimary;

  final Color primaryContainer;
  final Color onPrimaryContainer;

  final Color secondary;
  final Color onSecondary;

  final Color secondaryContainer;
  final Color onSecondaryContainer;

  final Color error;
  final Color onError;

  final Color errorContainer;
  final Color onErrorContainer;

  /// Example: Cards, Elevated Container Color, Popup Dialog Background Color
  final Color surface;
  final Color onSurface;

  /// Example: Screen background
  final Color background;
  final Color onBackground;

  /// This color is based on system status color
  final Color system;
  final Color onSystem;

  const ColorResourceModel({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.system,
    required this.onSystem,
  });
}
