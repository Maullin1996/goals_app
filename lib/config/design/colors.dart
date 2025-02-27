import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF1976D2);

  /// Strong blue (primary)

  static const Color primaryVariant = Color(0xFF0D47A1);

  /// Darker blue (variant)

  static const Color secondary = Color(0xFF42A5F5);

  /// Light blue (secondary)

  static const Color secondaryVariant = Color(0xFF1E88E5);

  /// Slightly darker light blue (variant)

  static const Color background = Color(0xFFE3F2FD);

  /// Soft blue background for a calm look

  static const Color surface = Color(0xFFFFFFFF);

  /// White for notes surface

  static const Color error = Color(0xFFD32F2F);

  /// Strong red for errors

  static const Color onPrimary = Color(0xFFFFFFFF);

  /// White on blue for readability

  static const Color onSecondary = Color(0xFF000000);

  /// Black on light blue for contrast

  static const Color onBackground = Color(0xFF212121);

  /// Dark gray for readability

  static const Color onSurface = Color(0xFF212121);

  /// Consistent dark gray

  static const Color onError = Color(0xFFFFFFFF);

  /// White on red for errors

  static const Color backGroundButton = Color.fromARGB(255, 202, 222, 238);

  /// Primary light color for backGound buttons

  static const Color backGroundButtonError = Color.fromARGB(125, 255, 87, 87);

  /// Primary light color for backGound buttons

  static const Color backGroundText = Color.fromRGBO(117, 117, 117, 0.788);

  /// Primary light color for backGound buttons
}
