library authentication_view;

import 'package:authentication_view/button_style.dart';
import 'package:authentication_view/button_view.dart';
import 'package:authentication_view/field_style.dart';
import 'package:authentication_view/field_icons.dart';
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
  Widget placeHolderBelowButton;
  List<FieldIcons> fieldIcons;

  LoginView(
      {this.fieldTypes,
      @required this.onValidation,
      this.headerLayout,
      this.field1Validator,
      this.field2Validator,
      this.fieldStyle, this.buttonStyle,
      this.placeHolderAboveButton,
      this.placeHolderBelowButton,
      this.fieldIcons});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  List<FieldType> fieldTypes;
  ValidationCallback onValidation;
  Widget headerLayout;
  Widget placeHolderAboveButton;
  Widget placeHolderBelowButton;

  List<TextEditingController> textEditingControllers = [
    TextEditingController(),
    TextEditingController()
  ];
  FormFieldValidator field1Validator;
  FormFieldValidator field2Validator;
  FieldStyle fieldStyle;
  ButtonStyle buttonStyle;
  VoidCallback onButtonPressed;
  final FocusNode field1FocusNode = FocusNode();
  final FocusNode field2FocusNode = FocusNode();
  List<FieldIcons> fieldIcons;

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
    fieldIcons = widget.fieldIcons ?? null;
    placeHolderBelowButton = widget.placeHolderBelowButton ?? Container(height: 0, width: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        headerLayout,
        Padding(
          padding: fieldStyle.outerPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Space(fieldStyle.spaceToTopField),
                TextFormFieldView(
                  leftIcon: (fieldIcons != null && fieldIcons.length > 0 && fieldIcons[0].leftIconEnabled) ? fieldIcons[0].leftIcon : null,
                  focusNode: field1FocusNode,
                  fieldStyle: fieldStyle,
                    fieldType: fieldTypes[0],
                    textEditingController: textEditingControllers[0],
                    formFieldValidator: field1Validator,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (String value) {
                        _fieldFocusChange(context, field1FocusNode, field2FocusNode);
                    },
                ),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: (fieldIcons != null && fieldIcons.length > 1 && fieldIcons[1].leftIconEnabled) && fieldIcons[1].leftIconEnabled ? fieldIcons[1].leftIcon : null,
                  focusNode: field2FocusNode,
                    fieldStyle: fieldStyle,
                    fieldType: fieldTypes[1],
                    textEditingController: textEditingControllers[1],
                    formFieldValidator: field2Validator,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (String value) {
                      _resetFocus(context);
                  },),
                Space(fieldStyle.spaceBetweenFields),
                placeHolderAboveButton,
                Space(fieldStyle.spaceToBottomField),
                ButtonView(onButtonPressed: () {
                    onValidation(
                        _formKey.currentState.validate(),
                        textEditingControllers[0].text,
                        textEditingControllers[1].text);
                }, buttonStyle: buttonStyle),
                Space(fieldStyle.spaceBetweenFields),
                placeHolderBelowButton
              ],
            ),
          ),
        ),
      ],
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  _resetFocus(BuildContext context) {
    field1FocusNode.unfocus();
    field2FocusNode.unfocus();
  }
}

typedef ValidationCallback = void Function(
    bool isValidationSuccess, String value1, String value2);
