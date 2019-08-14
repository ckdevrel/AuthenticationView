import 'package:flutter/material.dart';

class FieldType {
  final String hint;
  final int maxLength;
  final TextInputType keyboardType;
  final bool hideField;

  const FieldType.value(this.hint, this.maxLength, this.keyboardType, this.hideField);
}
