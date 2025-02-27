import 'package:flutter/material.dart';
import 'package:goals_app/config/design/tokens.dart';

/// A custom text form field widget for writing notes.
class NoteTextField extends StatelessWidget {
  /// The controller for the text form field.
  final TextEditingController controller;

  /// The initial value of the text form field.
  final String? initialValue;

  /// The hint text displayed in the text form field.
  final String hintText;

  /// The maximum number of lines for the text form field.
  final int maxLines;

  /// Creates a [NoteTextField].
  ///
  /// The [controller] parameter must not be null.
  const NoteTextField({
    super.key,
    required this.controller,
    this.hintText = "Write your note here...",
    this.maxLines = 5,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 16, color: AppColors.onSurface),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.backGroundText),
        filled: true,
        fillColor: AppColors.background, // Light background for contrast
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xmedium,
          vertical: AppSpacing.small,
        ),
      ),
    );
  }
}
