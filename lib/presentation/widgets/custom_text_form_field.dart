import 'package:flutter/material.dart';

/// A custom text form field widget that provides a styled text input field.
class CustomTextFormField extends StatelessWidget {
  /// Creates a [CustomTextFormField].
  ///
  /// The [textStyle], [title], and [controller] parameters must not be null.
  const CustomTextFormField({
    super.key,
    required this.textStyle,
    required this.title,
    required this.controller,
    this.validator,
  });

  /// The title of the text form field.
  final String title;

  /// The text style of the title.
  final TextStyle textStyle;

  /// The controller for the text form field.
  final TextEditingController controller;

  /// The validator function for the text form field.
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        label: Text(title, style: textStyle),
        isDense: true,
      ),
    );
  }
}
