import 'package:firestore/import.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: kPrimaryLightColor),
      titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryLightColor), gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryLightColor), gapPadding: 10),
    ),
    // textTheme: const TextTheme(
    //   bodyText1: TextStyle(color: kPrimaryLightColor, fontFamily: 'Roboto'),
    //   bodyText2: TextStyle(color: kPrimaryLightColor, fontFamily: 'Roboto'),
    // ),
    fontFamily: 'Roboto',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
