import 'package:authentication_view/field_style.dart';
import 'package:authentication_view/field_type.dart';
import 'package:example/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:authentication_view/authentication_view.dart';

import 'app_colors.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.  const FieldType.value(Constants.FIELD_ADDRESS, 30, TextInputType.text, false),
  static const FieldType MOBILE =  FieldType.MOBILE;
  static const FieldType EMAIL =   FieldType.EMAIL;
  static const FieldType NAME =    FieldType.NAME;
  static const FieldType PASSWORD =  FieldType.PASSWORD;
  static const FieldType CONFIRM_PASSWORD =  FieldType.CONFIRM_PASSWORD;
  static const FieldType ADDRESS =  FieldType.value(Constants.FIELD_ADDRESS, 30, TextInputType.text, false);
  static const FieldType CITY =     FieldType.value(Constants.FIELD_CITY, 20, TextInputType.text, false);
  static const FieldType PINCODE =  FieldType.value(Constants.FIELD_PINCODE, 6, TextInputType.number, false);
  static const FieldType ALTERNATE_NUMBER =   FieldType.value(
      Constants.FIELD_ALTERNATE_NUMBER, 10, TextInputType.phone, false);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: AuthenticationView(
          fieldStyle: FieldStyle.value(0, 8, 24, 24,
              AppColors.underline, AppColors.green, AppColors.text_grey),
          fieldValidator: (fieldType, values) {
            String value = values[fieldType];
            switch(fieldType){
              case NAME:
                return FieldValidator.validateName(value);
              case MOBILE:
                return FieldValidator.validateMobileNumber(value);
              case ALTERNATE_NUMBER:
                return FieldValidator.validateMobileNumber(value);
              case PINCODE:
                return FieldValidator.validatePincode(value);
              case CITY:
                return FieldValidator.validateCity(value);
              case ADDRESS:
                return FieldValidator.validateAddress(value);
              case EMAIL:
                return FieldValidator.validateEmailAddress(value);
              case PASSWORD:
                return FieldValidator.validatePassword(value);
              case CONFIRM_PASSWORD:
                return FieldValidator.validateConfirmPassword(values[FieldType.PASSWORD], value);
              default:
                return null;
            }
          },
          fieldTypes: [
            NAME,
            ADDRESS,
            CITY,
            PINCODE,
            MOBILE,
            ALTERNATE_NUMBER,
            EMAIL,
            PASSWORD,
            CONFIRM_PASSWORD
          ],
          onValidation: (bool isValidationSuccess, values) {
            debugPrint("Validation success = "+ isValidationSuccess.toString());
            debugPrint("All the values are " + values.toString());
          },
        ),
      ),
    );
  }
}
