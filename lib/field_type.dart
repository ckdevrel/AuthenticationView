import 'package:flutter/material.dart';

class FieldType {
  static const EMAIL  = const FieldType.value(hint: 'Email address', maxLength: 50, keyboardType: TextInputType.emailAddress, hideField: false);
  static const MOBILE = const FieldType.value(hint: 'Mobile number', maxLength: 10, keyboardType: TextInputType.number, hideField: false);
  static const EMPLOYEE_ID  = const FieldType.value(hint: 'Employee Id', maxLength: 5, keyboardType: TextInputType.number, hideField: false);
  static const PASSWORD  = const FieldType.value(hint: 'Password', maxLength: 15, keyboardType: TextInputType.number, hideField: true);

  final String hint;
  final int maxLength;
  final TextInputType keyboardType;
  final bool hideField;

  const FieldType.value({this.hint, this.maxLength, this.keyboardType, this.hideField});
}
