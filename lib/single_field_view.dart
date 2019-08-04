library authentication_view;

import 'package:authentication_view/button_style.dart';
import 'package:authentication_view/button_view.dart';
import 'package:authentication_view/field_style.dart';
import 'package:authentication_view/field_icons.dart';
import 'package:authentication_view/field_type.dart';
import 'package:authentication_view/space.dart';
import 'package:authentication_view/util.dart';
import 'package:flutter/material.dart';
import 'text_form_field_view.dart';

class SingleFieldView extends StatefulWidget {
  FieldType fieldType;
  SingleFieldCallback onValidation;
  Widget headerLayout;
  Widget titleLayout;
  Widget messageLayout;
  FormFieldValidator fieldValidator;
  FieldStyle fieldStyle;
  ButtonStyle buttonStyle;
  FieldIcons fieldIcon;
  String buttonText;

  SingleFieldView(
      {this.fieldType,
      @required this.onValidation,
      this.headerLayout,
      this.fieldValidator,
      this.fieldStyle, this.buttonStyle,
      this.titleLayout,
      this.messageLayout, this.fieldIcon,
      this.buttonText});

  @override
  _SingleFieldViewState createState() => _SingleFieldViewState();
}

class _SingleFieldViewState extends State<SingleFieldView> {
  final _formKey = GlobalKey<FormState>();

  FieldType fieldType;
  SingleFieldCallback onValidation;
  Widget headerLayout;
  Widget titleLayout;
  Widget messageLayout;
  FormFieldValidator fieldValidator;
  TextEditingController textEditingController = TextEditingController();
  FieldStyle fieldStyle;
  ButtonStyle buttonStyle;
  VoidCallback onButtonPressed;
  final FocusNode fieldFocusNode = FocusNode();
  FieldIcons fieldIcon;
  String buttonText;

  @override
  void initState() {
    super.initState();
    fieldType = widget.fieldType ?? [FieldType.MOBILE, FieldType.PASSWORD];
    onValidation = widget.onValidation ?? null;
    headerLayout = widget.headerLayout ?? Container(height: 0, width: 0);
    titleLayout =
        widget.titleLayout ?? Container(height: 0, width: 0);
    fieldValidator = widget.fieldValidator ?? null;
    fieldStyle = widget.fieldStyle ?? FieldStyle.DEFAULT;
    buttonStyle = widget.buttonStyle ?? ButtonStyle.DEFAULT;
    fieldIcon = widget.fieldIcon ?? null;
    messageLayout = widget.messageLayout ?? Container(height: 0, width: 0);
    buttonText = widget.buttonText ?? "VERIFY";
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
                titleLayout,
                Space(fieldStyle.spaceBetweenFields),
                messageLayout,
                Space(fieldStyle.spaceBetweenFields),
                TextFormFieldView(
                  leftIcon: fieldIcon != null ? fieldIcon.leftIcon : null,
                  focusNode: fieldFocusNode,
                  fieldStyle: fieldStyle,
                    fieldType: fieldType,
                    textEditingController: textEditingController,
                    formFieldValidator: fieldValidator,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (String value) {
                        fieldFocusNode.unfocus();
                    },
                ),
                Space(fieldStyle.spaceToBottomField),
                ButtonView(buttonText: buttonText,
                    onButtonPressed: () {
                    onValidation(
                        _formKey.currentState.validate(),
                        textEditingController.text);
                }, buttonStyle: buttonStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

typedef SingleFieldCallback = void Function(
    bool isValidationSuccess, String value);
