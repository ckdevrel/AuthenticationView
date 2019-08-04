import 'package:authentication_view/field_style.dart';
import 'package:authentication_view/field_type.dart';
import 'package:flutter/material.dart';

class TextFormFieldView extends TextFormField {
  TextEditingController textEditingController;
  FormFieldValidator formFieldValidator;
  FieldType fieldType;
  FieldStyle fieldStyle;
  TextInputAction textInputAction;
  ValueChanged<String> onFieldSubmitted;
  FocusNode focusNode;
  Widget leftIcon;

  TextFormFieldView(
      {this.fieldType,
      this.textEditingController,
      this.formFieldValidator,
      this.fieldStyle,
      this.textInputAction,
      @required this.onFieldSubmitted,
      this.focusNode,
      this.leftIcon})
      : super(
          focusNode: focusNode,
          textInputAction: textInputAction,
          controller: textEditingController,
          decoration: InputDecoration(
            prefixIcon: leftIcon,
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: fieldStyle.underlineDefaultColor)),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: fieldStyle.underlineFocusedColor)),
              hintStyle: TextStyle(color: fieldStyle.textColor),
              hintText: fieldType.hint),
          maxLength: fieldType.maxLength,
          validator: formFieldValidator,
          obscureText: fieldType.hideField,
          onFieldSubmitted: onFieldSubmitted,
        );
}
