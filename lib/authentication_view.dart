library authentication_view;

import 'package:flutter/material.dart';

import 'login_view.dart';

enum ScreenType {
  LOGIN,
  SIGNUP
}

class AuthenticationView extends StatelessWidget{
  ScreenType screenType;
  List<FieldType> fieldTypes;
  ValidationCallback onValidation;
  String buttonText;
  Widget headerLayout;

  AuthenticationView({this.screenType, this.fieldTypes, @required this.onValidation, this.buttonText, this.headerLayout});

  @override
  Widget build(BuildContext context) {
   switch(screenType) {
      case ScreenType.LOGIN:
        return LoginView(fieldTypes: fieldTypes, onValidation: onValidation, buttonText: buttonText, headerLayout: headerLayout);

      case ScreenType.SIGNUP:
        return LoginView(fieldTypes: fieldTypes, onValidation: onValidation, buttonText: buttonText, headerLayout: headerLayout);
    }
   return null;
  }
}

typedef ValidationCallback = void Function(bool isValidationSuccess, List<String> fieldValues);
