library authentication_view;

import 'package:flutter/material.dart';

import 'login_view.dart';

enum ScreenType {
  LOGIN,
  SIGNUP
}

class AuthenticationView extends StatelessWidget{
  ScreenType screenType = ScreenType.LOGIN;
  List<FieldType> fieldTypes = [FieldType.MOBILE, FieldType.PASSWORD];
  Function(bool isValidationSuccess) onPressed;

  AuthenticationView({this.screenType, this.fieldTypes, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
   switch(screenType) {
      case ScreenType.LOGIN:
        return LoginView(fieldTypes: fieldTypes, onPressed: onPressed);

      case ScreenType.SIGNUP:
        return LoginView(fieldTypes: fieldTypes, onPressed: onPressed);
    }
   return null;
  }
}