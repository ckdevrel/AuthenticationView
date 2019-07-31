library authentication_view;

import 'package:flutter/material.dart';

import 'login_view.dart';

enum Flow {
  LOGIN,
  SIGNUP
}

class AuthenticationView {
  Flow flow = Flow.LOGIN;
  List<FieldType> fieldTypes = [FieldType.MOBILE, FieldType.PASSWORD];
  Function(bool isValidationSuccess) onPressed;

  AuthenticationView({this.flow, this.fieldTypes, @required this.onPressed}) {
    switch(flow) {
      case Flow.LOGIN:
        LoginView(fieldTypes: fieldTypes, onPressed: onPressed);
        break;

      case Flow.SIGNUP:
        LoginView(fieldTypes: fieldTypes, onPressed: onPressed);
        break;
    }
  }
}