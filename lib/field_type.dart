import 'package:flutter/material.dart';

class FieldType {
  static const EMAIL  = const FieldType.value('Email address', 50, TextInputType.emailAddress, false);
  static const MOBILE = const FieldType.value('Mobile number', 10, TextInputType.number, false);
  static const EMPLOYEE_ID  = const FieldType.value('Employee Id', 5, TextInputType.number, false);
  static const PASSWORD  = const FieldType.value('Password', 15, TextInputType.number, true);

  final String hint;
  final int maxLength;
  final TextInputType keyboardType;
  final bool hideField;

  const FieldType.value(this.hint, this.maxLength, this.keyboardType, this.hideField);
}
