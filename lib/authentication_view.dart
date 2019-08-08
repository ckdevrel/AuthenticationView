library authentication_view;

import 'package:authentication_view/button_style.dart';
import 'package:authentication_view/button_view.dart';
import 'package:authentication_view/field_icons.dart';
import 'package:authentication_view/field_style.dart';
import 'package:authentication_view/field_type.dart';
import 'package:authentication_view/space.dart';
import 'package:authentication_view/text_form_field_view.dart';
import 'package:flutter/material.dart';

class AuthenticationView extends StatefulWidget {
  List<FieldType> fieldTypes;
  ValidationCallback onValidation;
  Widget headerLayout;
  Widget titleLayout;
  Widget messageLayout;
  FieldValidationCallback fieldValidator;
  FieldStyle fieldStyle;
  ButtonStyle buttonStyle;
  Widget placeHolderAboveButton;
  Widget placeHolderBelowButton;
  List<FieldIcons> fieldIcons;
  String buttonText;

  AuthenticationView(
      {this.fieldTypes,
      @required this.onValidation,
      this.headerLayout,
      this.fieldValidator,
      this.fieldStyle, this.buttonStyle,
      this.placeHolderAboveButton,
      this.placeHolderBelowButton,
      this.fieldIcons,
      this.buttonText,
      this.messageLayout, this.titleLayout});

  @override
  _AuthenticationViewState createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  final _formKey = GlobalKey<FormState>();

  List<FieldType> fieldTypes;
  ValidationCallback onValidation;
  Widget headerLayout;
  Widget placeHolderAboveButton;
  Widget placeHolderBelowButton;
  Widget titleLayout;
  Widget messageLayout;

  Map<int, TextEditingController> textEditingControllers = {};
  Map<int, FocusNode> focusNodes = {};
  FieldValidationCallback fieldValidator;
  FieldStyle fieldStyle;
  ButtonStyle buttonStyle;
  VoidCallback onButtonPressed;
  List<FieldIcons> fieldIcons;
  String buttonText;

  @override
  void initState() {
    fieldTypes = widget.fieldTypes ?? [FieldType.MOBILE, FieldType.PASSWORD];
    onValidation = widget.onValidation;
    headerLayout = widget.headerLayout ?? Container(height: 0, width: 0);
    placeHolderAboveButton =
        widget.placeHolderAboveButton ?? Container(height: 0, width: 0);
    titleLayout =
        widget.titleLayout ?? Container(height: 0, width: 0);
    messageLayout =
        widget.messageLayout ?? Container(height: 0, width: 0);
    fieldValidator = widget.fieldValidator;
    fieldStyle = widget.fieldStyle ?? FieldStyle.DEFAULT;
    buttonStyle = widget.buttonStyle ?? ButtonStyle.DEFAULT;
    fieldIcons = widget.fieldIcons;
    placeHolderBelowButton = widget.placeHolderBelowButton ?? Container(height: 0, width: 0);
    buttonText = widget.buttonText ?? "CONTINUE";
    init();
    super.initState();
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
        Visibility(visible: titleLayout != null, child: Space(fieldStyle.spaceToTopField)),
        titleLayout,
        messageLayout,
        Space(fieldStyle.spaceToTopField),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: fieldStyle.outerPadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: _getFormFields(),
            ),
          ),
        ),
        Space(fieldStyle.spaceToBottomField),
        placeHolderAboveButton,
        Visibility(visible: placeHolderAboveButton != null, child: Space(fieldStyle.spaceBetweenFields)),
        ButtonView(margin: fieldStyle.outerPadding, onButtonPressed: () {
          onValidation(
              _formKey.currentState.validate(),
              textEditingControllers);
        }, buttonStyle: buttonStyle, buttonText: buttonText),
        Visibility(visible: placeHolderBelowButton != null, child: Space(fieldStyle.spaceBetweenFields)),
        placeHolderBelowButton
      ],
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  _resetFocus(BuildContext context) {
    for (int index= 0; index < fieldTypes.length; index++) {
      focusNodes[index].unfocus();
    };
  }

  List<Widget> _getFormFields() {
    final List<Widget> widgets = [];
    for (int index = 0; index < fieldTypes.length; index++) {
      widgets.add(TextFormFieldView(
        autoFocus: index == 0,
        leftIcon: null,
        focusNode: focusNodes[index],
        fieldStyle: fieldStyle,
        fieldType: fieldTypes[index],
        textEditingController: textEditingControllers[index],
        formFieldValidator: (value) => fieldValidator(value, index),
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String value) {
            int currentPosition = index;
            int nextPosition = index + 1;
          if(isLastField(index)){
            _resetFocus(context);
          } else {
            _fieldFocusChange(
                context, focusNodes[currentPosition], focusNodes[nextPosition]);
          }

        },
      )
      );
      if(!isLastField(index)){
        widgets.add(Space(fieldStyle.spaceBetweenFields));
      }
    }
    return widgets;
  }

  bool isLastField(int index) => index == fieldTypes.length - 1;

  void init() {
    for (int index= 0; index < fieldTypes.length; index++) {
      textEditingControllers[index] = TextEditingController();
      focusNodes[index] = FocusNode();
    };
  }
}

typedef ValidationCallback = void Function(
    bool isValidationSuccess, Map<int, TextEditingController>);

typedef FieldValidationCallback = String Function(String value, int index);
