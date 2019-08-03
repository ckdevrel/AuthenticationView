library authentication_view;

import 'package:authentication_view/button_style.dart';
import 'package:authentication_view/button_view.dart';
import 'package:authentication_view/field_color.dart';
import 'package:authentication_view/field_type.dart';
import 'package:authentication_view/space.dart';
import 'package:flutter/material.dart';
import 'text_form_field_view.dart';

class LoginView extends StatefulWidget {
  List<FieldType> fieldTypes;
  ValidationCallback onValidation;
  Widget headerLayout;
  FormFieldValidator field1Validator;
  FormFieldValidator field2Validator;
  FieldStyle fieldStyle;
  ButtonStyle buttonStyle;
  Widget placeHolderAboveButton;

  LoginView(
      {this.fieldTypes,
      @required this.onValidation,
      this.headerLayout,
      this.field1Validator,
      this.field2Validator,
      this.fieldStyle, this.buttonStyle,
      this.placeHolderAboveButton});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  List<FieldType> fieldTypes;
  ValidationCallback onValidation;
  Widget headerLayout;
  Widget placeHolderAboveButton;

  List<TextEditingController> textEditingControllers = [
    TextEditingController(),
    TextEditingController()
  ];
  FormFieldValidator field1Validator;
  FormFieldValidator field2Validator;
  FieldStyle fieldStyle;
  ButtonStyle buttonStyle;
  VoidCallback onButtonPressed;

  @override
  void initState() {
    super.initState();
    fieldTypes = widget.fieldTypes ?? [FieldType.MOBILE, FieldType.PASSWORD];
    onValidation = widget.onValidation ?? null;
    headerLayout = widget.headerLayout ?? Container(height: 0, width: 0);
    placeHolderAboveButton =
        widget.placeHolderAboveButton ?? Container(height: 0, width: 0);
    field1Validator = widget.field1Validator ?? null;
    field2Validator = widget.field2Validator ?? null;
    fieldStyle = widget.fieldStyle ?? FieldStyle.DEFAULT;
    buttonStyle = widget.buttonStyle ?? ButtonStyle.DEFAULT;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        headerLayout,
        Padding(
          padding: EdgeInsets.all(fieldStyle.outerPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Space(fieldStyle.spaceToTopField),
                TextFormFieldView(
                    fieldStyle: fieldStyle,
                    fieldType: fieldTypes[0],
                    textEditingController: textEditingControllers[0],
                    formFieldValidator: field1Validator),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                    fieldStyle: fieldStyle,
                    fieldType: fieldTypes[1],
                    textEditingController: textEditingControllers[1],
                    formFieldValidator: field2Validator),
                Space(fieldStyle.spaceBetweenFields),
                placeHolderAboveButton,
                Space(fieldStyle.spaceToBottomField),
                ButtonView(onButtonPressed: () {
                    onValidation(
                        _formKey.currentState.validate(),
                        textEditingControllers[0].text,
                        textEditingControllers[1].text);
                }, buttonStyle: buttonStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

typedef ValidationCallback = void Function(
    bool isValidationSuccess, String value1, String value2);
