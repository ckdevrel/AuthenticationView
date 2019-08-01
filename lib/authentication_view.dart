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
  FormFieldValidator field1Validator;
  FormFieldValidator field2Validator;

  AuthenticationView({this.screenType, this.fieldTypes, @required this.onValidation, this.buttonText, this.headerLayout, this.field1Validator, this.field2Validator});

  @override
  Widget build(BuildContext context) {
   switch(screenType) {
      case ScreenType.LOGIN:
        return LoginView(fieldTypes: fieldTypes, onValidation: onValidation, buttonText: buttonText, headerLayout: headerLayout, field1Validator: field1Validator, field2Validator: field2Validator,);

      case ScreenType.SIGNUP:
        return LoginView(fieldTypes: fieldTypes, onValidation: onValidation, buttonText: buttonText, headerLayout: headerLayout, field1Validator: field1Validator, field2Validator: field2Validator,);
    }
   return null;
  }
}

typedef ValidationCallback = void Function(bool isValidationSuccess, List<String> fieldValues);
