import 'package:flutter/material.dart';
import 'package:goals_app/config/design/colors.dart';

/// A class that defines the themes used in the application.
abstract class Themes {
  /// The default theme for the application.
  static ThemeData defaultTheme = ThemeData(
    // Adjusts the visual density of the UI based on the platform.
    visualDensity: VisualDensity.adaptivePlatformDensity,

    // Sets the default font family for the application.
    fontFamily: 'Poppins',

    // Defines the text styles used throughout the application.
    textTheme: TextTheme(
      // Style for large display text.
      displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: AppColors.surface,
      ),
      // Style for medium display text.
      displayMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColors.surface,
      ),
      // Style for small display text.
      displaySmall: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: AppColors.surface,
      ),
      // Style for large headlines.
      headlineLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      ),
      // Style for large body text.
      bodyLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurface,
      ),
      // Style for medium body text.
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurface,
      ),
      // Style for small body text.
      bodySmall: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurface,
      ),
    ),
  );
}
