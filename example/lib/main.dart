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
  FieldType _name  =  FieldType.value(Constants.FIELD_NAME, 30, TextInputType.text, false);
  FieldType _email  =  FieldType.value(Constants.FIELD_EMAIL, 50, TextInputType.emailAddress, false);
  FieldType _mobile =  FieldType.value(Constants.FIELD_MOBILE, 10, TextInputType.phone, false);
  FieldType _password  =  FieldType.value(Constants.FIELD_PASSWORD, 15, TextInputType.text, true);
  FieldType _confirmPassword  =  FieldType.value(Constants.FIELD_CONFIRM_PASSWORD, 15, TextInputType.text, true);
  FieldType _address =  FieldType.value(Constants.FIELD_ADDRESS, 30, TextInputType.text, false);
  FieldType _city =     FieldType.value(Constants.FIELD_CITY, 20, TextInputType.text, false);
  FieldType _pincode =  FieldType.value(Constants.FIELD_PINCODE, 6, TextInputType.number, false);
  FieldType _alternateNumber =   FieldType.value(
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
          fieldValidator: (hintAsKey, values) {
            String value = values[hintAsKey];
            switch(hintAsKey){
              case Constants.FIELD_NAME:
                return FieldValidator.validateName(value);
              case Constants.FIELD_MOBILE:
                return FieldValidator.validateMobileNumber(value);
              case Constants.FIELD_ALTERNATE_NUMBER:
                return FieldValidator.validateMobileNumber(value);
              case Constants.FIELD_PINCODE:
                return FieldValidator.validatePincode(value);
              case Constants.FIELD_CITY:
                return FieldValidator.validateCity(value);
              case Constants.FIELD_ADDRESS:
                return FieldValidator.validateAddress(value);
              case Constants.FIELD_EMAIL:
                return FieldValidator.validateEmailAddress(value);
              case Constants.FIELD_PASSWORD:
                return FieldValidator.validatePassword(value);
              case Constants.FIELD_CONFIRM_PASSWORD:
                return FieldValidator.validateConfirmPassword(values[Constants.FIELD_PASSWORD], value);
              default:
                return null;
            }
          },
          fieldTypes: [
            _name,
            _address,
            _city,
            _pincode,
            _mobile,
            _alternateNumber,
            _email,
            _password,
            _confirmPassword
          ],
          onValidation: (bool isValidationSuccess, valueMap) {
            debugPrint("Validation success = "+ isValidationSuccess.toString());
            debugPrint("All the values are " + valueMap.toString());
          },
        ),
      ),
    );
  }
}
