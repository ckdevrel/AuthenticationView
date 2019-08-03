import 'package:authentication_view/auth_colors.dart';
import 'package:flutter/material.dart';

class FieldStyle {
  static const DEFAULT  = const FieldStyle.value(24, 16, 24, 36, AuthColors.underline, AuthColors.green, AuthColors.text_grey);

  final double spaceBetweenFields;
  final double spaceToTopField;
  final double spaceToBottomField;
  final double outerPadding;
  final Color underlineDefaultColor;
  final Color underlineFocusedColor;
  final Color textColor;

  const FieldStyle.value(this.spaceToTopField, this.spaceBetweenFields, this.spaceToBottomField, this.outerPadding, this.underlineDefaultColor, this.underlineFocusedColor, this.textColor);
}
