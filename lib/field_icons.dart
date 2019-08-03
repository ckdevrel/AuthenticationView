import 'package:flutter/material.dart';

class FieldIcons {

  static const EMAIL  = const FieldIcons.value(leftIconEnabled: true, rightIconEnabled: false, leftIcon: Icon(Icons.email, size: 16));
  static const MOBILE = const FieldIcons.value(leftIconEnabled: true, rightIconEnabled: false, leftIcon: Icon(Icons.phone_android, size: 16));
  static const EMPLOYEE_ID  = const FieldIcons.value(leftIconEnabled: true, rightIconEnabled: false, leftIcon: Icon(Icons.person, size: 16));
  static const PASSWORD  = const FieldIcons.value(leftIconEnabled: true, rightIconEnabled: false, leftIcon: Icon(Icons.lock, size: 16));

  final Widget leftIcon;
  final bool leftIconEnabled;
  final bool rightIconEnabled;

  const FieldIcons.value({this.leftIconEnabled, this.rightIconEnabled, this.leftIcon});
}