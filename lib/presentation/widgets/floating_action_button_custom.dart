import 'package:flutter/material.dart';
import 'package:goals_app/config/design/tokens.dart';

/// A custom floating action button widget that provides a styled button.
class FloatingActionButtonCustom extends StatelessWidget {
  /// The callback that is called when the button is pressed.
  final VoidCallback onPressed;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The color of the icon.
  final Color? iconColor;

  /// The icon to display inside the button.
  final IconData? iconTheme;

  /// The hero tag for the button.
  final String? heroTag;

  /// Creates a [FloatingActionButtonCustom].
  ///
  /// The [onPressed] parameter must not be null.
  const FloatingActionButtonCustom({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.iconTheme,
    this.iconColor,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag ?? UniqueKey().toString(),
      onPressed: onPressed,
      shape: CircleBorder(),
      backgroundColor: backgroundColor ?? AppColors.backGroundButton,
      child: Icon(
        iconTheme ?? Icons.add_circle_sharp,
        color: iconColor ?? AppColors.primary,
      ),
    );
  }
}
