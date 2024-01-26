import 'import.dart';

const kPrimaryColor = Color(0xFF868686);
const kPrimaryLightColor = Color(0xFF868686);
const kWhite = Colors.white;
const kSecondaryColor = Color(0xFF010F07);
const kTextColor = Color(0xFF010F07);
const kAnimationDurationColor = Duration(microseconds: 500);
const kOtherColor = Color(0xFF4285F4);
const kOtherWiseColor = Color(0xFF395998);

final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = 'Please enter your email';
const String kValidEmailError = 'Please enter vaild email';
const String kPassNullError = 'Please enter your password';
const String kShortPassError = 'Password is too short';
const String kLongPassError = 'Password is maximum 16 characters';
const String kMatchPassError = 'Password dont\'t match';

const headingStyle =
TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold);

final otpInput = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12.0 ,vertical: 18.0),
    enabledBorder: outlineInputBorder(
    ),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder()
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: kPrimaryLightColor),
  );
}


Widget w(double width) => SizedBox(width: width);
Widget h(double height) => SizedBox(height: height);