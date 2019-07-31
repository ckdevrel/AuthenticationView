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
  String buttonText = "CONTINUE";
  Widget headerLayout = Container();

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
