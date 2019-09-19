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
  FieldType _name  =  FieldType.value(Constants.ID_NAME, Constants.FIELD_NAME, 30, TextInputType.text, false);
  FieldType _email  =  FieldType.value(Constants.ID_EMAIL, Constants.FIELD_EMAIL, 50, TextInputType.emailAddress, false);
  FieldType _mobile =  FieldType.value(Constants.ID_MOBILE, Constants.FIELD_MOBILE, 10, TextInputType.phone, false);
  FieldType _password  =  FieldType.value(Constants.ID_PASSWORD, Constants.FIELD_PASSWORD, 15, TextInputType.text, true);
  FieldType _confirmPassword  =  FieldType.value(Constants.ID_CONFIRM_PASSWORD, Constants.FIELD_CONFIRM_PASSWORD, 15, TextInputType.text, true);
  FieldType _address =  FieldType.value(Constants.ID_ADDRESS, Constants.FIELD_ADDRESS, 30, TextInputType.text, false);
  FieldType _city =     FieldType.value(Constants.ID_CITY, Constants.FIELD_CITY, 20, TextInputType.text, false);
  FieldType _pincode =  FieldType.value(Constants.ID_PINCODE, Constants.FIELD_PINCODE, 6, TextInputType.number, false);
  FieldType _alternateNumber =   FieldType.value(Constants.ID_ALTERNATE_NUMBER,
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
          fieldValidator: (id, values) {
            String value = values[id];
            switch(id){
              case Constants.ID_NAME:
                return FieldValidator.validateName(value);
              case Constants.ID_MOBILE:
                return FieldValidator.validateMobileNumber(value);
              case Constants.ID_ALTERNATE_NUMBER:
                return FieldValidator.validateMobileNumber(value);
              case Constants.ID_PINCODE:
                return FieldValidator.validatePincode(value);
              case Constants.ID_CITY:
                return FieldValidator.validateCity(value);
              case Constants.ID_ADDRESS:
                return FieldValidator.validateAddress(value);
              case Constants.ID_EMAIL:
                return FieldValidator.validateEmailAddress(value);
              case Constants.ID_PASSWORD:
                return FieldValidator.validatePassword(value);
              case Constants.ID_CONFIRM_PASSWORD:
                return FieldValidator.validateConfirmPassword(values[Constants.ID_PASSWORD], value);
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
