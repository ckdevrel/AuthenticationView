library authentication_view;

import 'package:flutter/material.dart';

import 'login_view.dart';

enum Flow {
  LOGIN,
  SIGNUP
}

class AuthenticationView extends StatelessWidget{
  Flow flow = Flow.LOGIN;
  List<FieldType> fieldTypes = [FieldType.MOBILE, FieldType.PASSWORD];
  Function(bool isValidationSuccess) onPressed;

  AuthenticationView({this.flow, this.fieldTypes, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
   switch(flow) {
      case Flow.LOGIN:
        return LoginView(fieldTypes: fieldTypes, onPressed: onPressed);

      case Flow.SIGNUP:
        return LoginView(fieldTypes: fieldTypes, onPressed: onPressed);
    }
   return null;
  }
}