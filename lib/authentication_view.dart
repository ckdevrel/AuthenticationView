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
  ValidationCallback onValidation;

  AuthenticationView({this.screenType, this.fieldTypes, @required this.onValidation});

  @override
  Widget build(BuildContext context) {
   switch(screenType) {
      case ScreenType.LOGIN:
        return LoginView(fieldTypes: fieldTypes, onValidation: onValidation);

      case ScreenType.SIGNUP:
        return LoginView(fieldTypes: fieldTypes, onValidation: onValidation);
    }
   return null;
  }
}

typedef ValidationCallback = void Function(bool isValidationSuccess, List<String> fieldValues);
