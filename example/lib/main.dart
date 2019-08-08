import 'package:authentication_view/field_style.dart';
import 'package:authentication_view/field_type.dart';
import 'package:flutter/material.dart';
import 'package:authentication_view/authentication_view.dart';

import 'app_colors.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: AuthenticationView(
          fieldStyle: FieldStyle.value(0, 8, 24, 24,
              AppColors.underline, AppColors.green, AppColors.text_grey),
          fieldValidator: (value, index) {},
          fieldTypes: [
            FieldType.NAME,
            const FieldType.value(Constants.FIELD_ADDRESS, 30, TextInputType.text, false),
            const FieldType.value(Constants.FIELD_CITY, 20, TextInputType.text, false),
            const FieldType.value(Constants.FIELD_PINCODE, 6, TextInputType.number, false),
            FieldType.MOBILE,
            const FieldType.value(
                Constants.FIELD_ALTERNATE_NUMBER, 10, TextInputType.phone, false),
            FieldType.EMAIL,
            FieldType.PASSWORD,
            FieldType.CONFIRM_PASSWORD
          ],
          onValidation: (bool isValidationSuccess, textEditingControllers) {
          },
        ),
      ),
    );
  }
}
