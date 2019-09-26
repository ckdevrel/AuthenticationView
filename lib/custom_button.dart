import 'package:authentication_view/button_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  ButtonStyle buttonStyle;
  VoidCallback onButtonPressed;
  String buttonText;
  EdgeInsetsGeometry margin;
  TextStyle textStyle;

  CustomButton({@required this.onButtonPressed, this.buttonStyle, this.buttonText, this.margin, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: margin,
      width: buttonStyle.width,
      height: buttonStyle.height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(buttonStyle.cornerRadius))),
        color: buttonStyle.buttonColor,
        textColor: buttonStyle.textColor,
        onPressed: onButtonPressed,
        child: Text(buttonText, style: textStyle),
      ),
    );
  }
}