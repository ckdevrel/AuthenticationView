import 'package:authentication_view/auth_colors.dart';
import 'package:flutter/material.dart';

class FieldStyle {
  static const DEFAULT = const FieldStyle.value(
      spaceToTopField: 24,
      spaceBetweenFields: 16,
      spaceToBottomField: 24,
      outerPadding: 36,
      underlineDefaultColor: AuthColors.underline,
      underlineFocusedColor: AuthColors.green,
      textColor: AuthColors.text_grey);

  final double spaceBetweenFields;
  final double spaceToTopField;
  final double spaceToBottomField;
  final double outerPadding;
  final Color underlineDefaultColor;
  final Color underlineFocusedColor;
  final Color textColor;

  const FieldStyle.value(
      {this.spaceToTopField,
      this.spaceBetweenFields,
      this.spaceToBottomField,
      this.outerPadding,
      this.underlineDefaultColor,
      this.underlineFocusedColor,
      this.textColor});
}
