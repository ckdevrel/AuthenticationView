library authentication_view;

import 'package:authentication_view/button_style.dart';
import 'package:authentication_view/button_view.dart';
import 'package:authentication_view/field_icons.dart';
import 'package:authentication_view/field_style.dart';
import 'package:authentication_view/field_type.dart';
import 'package:authentication_view/space.dart';
import 'package:authentication_view/text_form_field_view.dart';
import 'package:authentication_view/util.dart';
import 'package:flutter/material.dart';

import 'text_form_field_view.dart';

class RegistrationView extends StatefulWidget {
  List<FieldType> fieldTypes;
  RegistrationValidationCallback onValidation;
  Widget headerLayout;
  FormFieldValidator field1Validator,
      field2Validator,
      field3Validator,
      field4Validator,
      field5Validator,
      field6Validator,
      field7Validator,
      field8Validator,
      field9Validator;
  FieldStyle fieldStyle;
  ButtonStyle buttonStyle;
  Widget placeHolderAboveButton;
  List<FieldIcons> fieldIcons;
  String buttonText;

  RegistrationView(
      {this.fieldTypes,
        @required this.onValidation,
        this.headerLayout,
        this.field1Validator,
        this.field2Validator,
        this.field3Validator,
        this.field4Validator,
        this.field5Validator,
        this.field6Validator,
        this.field7Validator,
        this.field8Validator,
        this.field9Validator,
        this.fieldStyle,
        this.buttonStyle,
        this.placeHolderAboveButton,
        this.fieldIcons,
        this.buttonText}) : assert(fieldTypes != null && fieldTypes.length == 9);

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _formKey = GlobalKey<FormState>();

  List<FieldType> fieldTypes;
  RegistrationValidationCallback onValidation;
  Widget headerLayout;
  Widget placeHolderAboveButton;
  String buttonText;

  List<TextEditingController> textEditingControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  FormFieldValidator field1Validator,
      field2Validator,
      field3Validator,
      field4Validator,
      field5Validator,
      field6Validator,
      field7Validator,
      field8Validator,
      field9Validator;
  FieldStyle fieldStyle;
  ButtonStyle buttonStyle;
  VoidCallback onButtonPressed;
  final FocusNode field1FocusNode = FocusNode();
  final FocusNode field2FocusNode = FocusNode();
  final FocusNode field3FocusNode = FocusNode();
  final FocusNode field4FocusNode = FocusNode();
  final FocusNode field5FocusNode = FocusNode();
  final FocusNode field6FocusNode = FocusNode();
  final FocusNode field7FocusNode = FocusNode();
  final FocusNode field8FocusNode = FocusNode();
  final FocusNode field9FocusNode = FocusNode();
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
    field3Validator = widget.field3Validator ?? null;
    field4Validator = widget.field4Validator ?? null;
    field5Validator = widget.field5Validator ?? null;
    field6Validator = widget.field6Validator ?? null;
    field7Validator = widget.field7Validator ?? null;
    field8Validator = widget.field8Validator ?? null;
    field9Validator = widget.field9Validator ?? null;
    fieldStyle = widget.fieldStyle ?? FieldStyle.DEFAULT;
    buttonStyle = widget.buttonStyle ?? ButtonStyle.DEFAULT;
    fieldIcons = widget.fieldIcons ?? null;
    buttonText = widget.buttonText ?? "SUBMIT";
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
                  leftIcon: (Util.isLeftIconAvailable(0, fieldIcons) ? fieldIcons[0].leftIcon : null),
                  focusNode: field1FocusNode,
                  fieldStyle: fieldStyle,
                  fieldType: fieldTypes[0],
                  textEditingController: textEditingControllers[0],
                  formFieldValidator: field1Validator,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String value) {
                    _fieldFocusChange(
                        context, field1FocusNode, field2FocusNode);
                  },
                ),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: Util.isLeftIconAvailable(1, fieldIcons) ? fieldIcons[1].leftIcon : null,
                  focusNode: field2FocusNode,
                  fieldStyle: fieldStyle,
                  fieldType: fieldTypes[1],
                  textEditingController: textEditingControllers[1],
                  formFieldValidator: field2Validator,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String value) {
                    _fieldFocusChange(
                        context, field2FocusNode, field3FocusNode);
                  },
                ),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: Util.isLeftIconAvailable(2, fieldIcons) ? fieldIcons[2].leftIcon : null,
                  focusNode: field3FocusNode,
                  fieldStyle: fieldStyle,
                  fieldType: fieldTypes[2],
                  textEditingController: textEditingControllers[2],
                  formFieldValidator: field3Validator,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String value) {
                    _fieldFocusChange(
                        context, field3FocusNode, field4FocusNode);
                  },
                ),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: Util.isLeftIconAvailable(3, fieldIcons) ? fieldIcons[3].leftIcon : null,
                  focusNode: field4FocusNode,
                  fieldStyle: fieldStyle,
                  fieldType: fieldTypes[3],
                  textEditingController: textEditingControllers[3],
                  formFieldValidator: field4Validator,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String value) {
                    _fieldFocusChange(
                        context, field4FocusNode, field5FocusNode);
                  },
                ),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: Util.isLeftIconAvailable(4, fieldIcons) ? fieldIcons[4].leftIcon : null,
                  focusNode: field5FocusNode,
                  fieldStyle: fieldStyle,
                  fieldType: fieldTypes[4],
                  textEditingController: textEditingControllers[4],
                  formFieldValidator: field5Validator,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String value) {
                    _fieldFocusChange(
                        context, field5FocusNode, field6FocusNode);
                  },
                ),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: Util.isLeftIconAvailable(5, fieldIcons) ? fieldIcons[5].leftIcon : null,
                  focusNode: field6FocusNode,
                  fieldStyle: fieldStyle,
                  fieldType: fieldTypes[5],
                  textEditingController: textEditingControllers[5],
                  formFieldValidator: field6Validator,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String value) {
                    _fieldFocusChange(
                        context, field6FocusNode, field7FocusNode);
                  },
                ),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: Util.isLeftIconAvailable(6, fieldIcons) ? fieldIcons[6].leftIcon : null,
                  focusNode: field7FocusNode,
                  fieldStyle: fieldStyle,
                  fieldType: fieldTypes[6],
                  textEditingController: textEditingControllers[6],
                  formFieldValidator: field7Validator,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String value) {
                    _fieldFocusChange(
                        context, field7FocusNode, field8FocusNode);
                  },
                ),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: Util.isLeftIconAvailable(7, fieldIcons) ? fieldIcons[7].leftIcon : null,
                  focusNode: field8FocusNode,
                  fieldStyle: fieldStyle,
                  fieldType: fieldTypes[7],
                  textEditingController: textEditingControllers[7],
                  formFieldValidator: field8Validator,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String value) {
                    _fieldFocusChange(
                        context, field8FocusNode, field9FocusNode);
                  },
                ),
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: Util.isLeftIconAvailable(8, fieldIcons) ? fieldIcons[8].leftIcon : null,
                  focusNode: field9FocusNode,
                  fieldStyle: fieldStyle,
                  fieldType: fieldTypes[8],
                  textEditingController: textEditingControllers[8],
                  formFieldValidator: field9Validator,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (String value) {
                    _resetFocus(context);
                  },
                ),
                Space(fieldStyle.spaceBetweenFields),
                placeHolderAboveButton,
                Space(fieldStyle.spaceToBottomField),
                ButtonView(
                    buttonText: buttonText,
                    onButtonPressed: () {
                      onValidation(
                          _formKey.currentState.validate(),
                          [textEditingControllers[0].text,
                          textEditingControllers[1].text,
                          textEditingControllers[2].text,
                          textEditingControllers[3].text,
                          textEditingControllers[4].text,
                          textEditingControllers[5].text,
                          textEditingControllers[6].text,
                          textEditingControllers[7].text,
                          textEditingControllers[8].text]);
                    },
                    buttonStyle: buttonStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  _resetFocus(BuildContext context) {
    field1FocusNode.unfocus();
    field2FocusNode.unfocus();
    field3FocusNode.unfocus();
    field4FocusNode.unfocus();
    field5FocusNode.unfocus();
    field6FocusNode.unfocus();
    field7FocusNode.unfocus();
    field8FocusNode.unfocus();
    field9FocusNode.unfocus();
  }
}

typedef RegistrationValidationCallback = void Function(
    bool isValidationSuccess, List<String> values);

