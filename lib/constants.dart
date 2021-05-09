import 'package:flutter/material.dart';
import 'size_config.dart';
/// Үндсэн өнгө
class AppColors {
  static const kPrimaryColor = Color(0XFF6A62B7);
  static const kBackgroundColor = Color(0XFFE5E5E5);
  static const BackgroundColor = Colors.white;

  static const kTextColor = Color(0XFF2C2C2C);
  static const TextColor = Colors.white;
  static const BTextColor = Colors.black54;
  static const kCardInfoBG = Color(0XFF686868);
  static const kRatingStarColor = Color(0XFFF4D150);
  static const kInputBackgroundColor = Color(0XFFF3F3F3);
  static const kPrimaryLightColor = Color(0XFF897CFF);
  static const green = Colors.green;
  static var grey = Colors.grey;
  static const kSecondaryColor = Color(0xFF979797);

  static const kWeatherColor = Color(0xFFFF1744);

}




const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: AppColors.kTextColor),
  );
}

