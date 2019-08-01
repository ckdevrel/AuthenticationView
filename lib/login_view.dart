import 'package:flutter/material.dart';
import 'auth_colors.dart';
import 'authentication_view.dart';

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
  ValidationCallback onValidation;
  String buttonText;
  Widget headerLayout;

  LoginView({this.fieldTypes, @required this.onValidation, this.buttonText, this.headerLayout});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  List<FieldType> fieldTypes;
  ValidationCallback onValidation;
  String buttonText = "CONTINUE";
  Widget headerLayout = Container(height: 0, width: 0);
  List<TextEditingController> textEditingControllers = [TextEditingController(), TextEditingController()];

  @override
  void initState() {
    super.initState();
    fieldTypes = widget.fieldTypes ?? [FieldType.MOBILE, FieldType.PASSWORD];
    onValidation = widget.onValidation ?? null;
    buttonText = widget.buttonText ?? "CONTINUE";
    headerLayout = widget.headerLayout ?? Container();
  }

  @override
  Widget build(BuildContext context) {
    FieldType fieldType1 = fieldTypes[0];
    FieldType fieldType2 = fieldTypes[1];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        headerLayout,
        SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 24),
                TextFormField(
                  controller: textEditingControllers[0],
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
                    if (value.isEmpty) {
                      return fieldType1.errorText;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: textEditingControllers[1],
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AuthColors.underline)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AuthColors.green),
                      ),
                      hintStyle: TextStyle(color: AuthColors.text_grey),
                      hintText: fieldType2.hint),
                      maxLength: fieldType2.maxLength,
                  validator: (value) {
                    if (value.isEmpty) {
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
                    onPressed: () {
                      onValidation(_formKey.currentState.validate(), [textEditingControllers[0].text, textEditingControllers[1].text]);
                    },
                    child: Text(widget.buttonText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
