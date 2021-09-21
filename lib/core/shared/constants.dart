import 'package:flutter/material.dart';
import 'package:learncard/core/shared/size_helper.dart';

const Color pageBackgroundColor = Color(0xFFEFEBE9);
const Color buttonBackgroundColor1 = Color(0xFF8D6E63);
const Color buttonBackgroundColor2 = Color(0xFFBCAAA4);
const String fontFamilyRobotoMono = 'RobotoMono';
const Color fontHeadingColor = Color(0xFFC2B3A0);
const Color fontTextColor1 = Color(0xFF6D4C41);
const Color fontTextColor2 = Color(0xFF8F6457);
const Color fontTextColor3 = Color(0xFFC2B3A0);
const TextStyle errorTextStyle = TextStyle(
  fontFamily: 'RobotoMono',
  fontWeight: FontWeight.normal,
  fontSize: 15,
  color: Colors.red,
  letterSpacing: 0,
);
const TextStyle hintTextStyle = TextStyle(
  fontFamily: 'RobotoMono',
  fontWeight: FontWeight.normal,
  fontSize: 18,
  color: Colors.black54,
  letterSpacing: 0,
);
const TextStyle labelTextStyle = TextStyle(
  fontFamily: 'RobotoMono',
  fontWeight: FontWeight.normal,
  fontSize: 22,
  color: Color(0xFF6D4C41),
  letterSpacing: 0,
);
const TextStyle inputTextStyle = TextStyle(
  fontFamily: 'RobotoMono',
  fontWeight: FontWeight.normal,
  fontSize: 20,
  color: Colors.black,
  letterSpacing: 0,
);
const TextStyle titleInputTextStyle = TextStyle(
  //fontFamily: 'RobotoMono',
  fontWeight: FontWeight.bold,
  fontSize: 48,
  color: Color(0xFFC2B3A0),
  letterSpacing: 2,
);

class LocalDynamicConstant {
  static TextStyle buttonFont(BuildContext context) {
    return TextStyle(
      fontFamily: fontFamilyRobotoMono,
      fontWeight: FontWeight.bold,
      fontSize: getScreenHeight(context) * 0.03,
      color: Colors.white,
      letterSpacing: 1,
    );
  }

  static String? passwordValidation({String password = ""}) {
    if (password.isEmpty)
      return "password must have value";
    else if (password.length < 5)
      return "enter minimum of 5 character";
    else if (password.length > 30)
      return "enter maximum of 30 character";
    else
      return null;
  }

  static String? emailValidation({String emailId = ""}) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp _regExp = new RegExp(pattern.toString());

    if (emailId.isEmpty)
      return 'email id must have value';
    else if (emailId.length > 50)
      return "maximum charater allowed is 50";
    else if (!_regExp.hasMatch(emailId))
      return 'enter the valid email id';
    else
      return null;
  }

  static String? nameValidation({String name = ""}) {
    if (name.isEmpty)
      return "name must have value";
    else if (name.length > 50)
      return "maximum charater allowed is 50";
    else
      return null;
  }

  static String? phoneValidation({String phoneno = ""}) {
    if (phoneno.isEmpty) {
      return "phone no. must have value";
    } else if (phoneno.length > 20) {
      return "maximum charater allowed is 20";
    }
    return null;
  }
}
