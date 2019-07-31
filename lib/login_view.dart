import 'package:flutter/material.dart';
import 'auth_colors.dart';

class FieldType {
  static const EMAIL  = const FieldType.value('Email address', 25, TextInputType.emailAddress, "Enter valid email address");
  static const MOBILE = const FieldType.value('Mobile number', 10, TextInputType.number, "Enter valid mobile number");
  static const EMPLOYEE_ID  = const FieldType.value('Employee Id', 5, TextInputType.number, "Enter valid 5 digit employee id");
  static const PASSWORD  = const FieldType.value('Password', 15, TextInputType.number, "Password must be between 4 and 8 digits long and include at least one numeric digit");

  final String hint;
  final String errorText;
  final int maxLength;
  final TextInputType keyboardType;

  const FieldType.value(this.hint, this.maxLength, this.keyboardType, this.errorText);
}

class LoginView extends StatefulWidget {

  List<FieldType> fieldTypes;
  Function(bool isValidationSuccess) onPressed;
  LoginView({this.fieldTypes, @required onPressed});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FieldType fieldType1 = widget.fieldTypes[0];
    FieldType fieldType2 = widget.fieldTypes[1];
    return SingleChildScrollView(
      padding: EdgeInsets.all(36),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Login', style: TextStyle(fontWeight: FontWeight.w700, color: AuthColors.text_black), textScaleFactor: 2.5),
                Icon(Icons.verified_user, color: AuthColors.green)
              ],
            ),
            SizedBox(height: 24),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AuthColors.underline)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AuthColors.green),
                ),
                hintStyle: TextStyle(color: AuthColors.text_grey),
                hintText: fieldType1.hint),
              keyboardType: fieldType1.keyboardType,
              maxLength: fieldType1.maxLength,
              validator: (value) {
                if (value.isEmpty || value.length != fieldType1.maxLength) {
                  return fieldType1.errorText;
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AuthColors.underline)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AuthColors.green),
                  ),
                  hintStyle: TextStyle(color: AuthColors.text_grey),
                  hintText: fieldType2.hint),
              validator: (value) {
                if (!RegExp(r"^(?=.*\d).{4,8}$").hasMatch(value)) {
                  return fieldType2.errorText;
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(height: 48),
            SizedBox(
              width: 240,
              height: 55,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(55))),
                color: AuthColors.green,
                textColor: Colors.white,
                onPressed: widget?.onPressed(_formKey.currentState.validate()),
                child: Text('COUNTINUE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
