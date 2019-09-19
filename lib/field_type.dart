import 'package:flutter/material.dart';

class FieldType {
  final String hint;
  final int maxLength;
  final TextInputType keyboardType;
  final bool hideField;
  final String id;

  const FieldType.value(this.id, this.hint, this.maxLength, this.keyboardType, this.hideField);
}
