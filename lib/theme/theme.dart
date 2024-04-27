
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Themings {
  static TextStyle darkText = GoogleFonts.montserrat(
    color: AppColors.black.withOpacity(0.5),
    // fontFamily: AppFonts.circularStd,
  );

  static TextStyle lightText = GoogleFonts.montserrat(
    color: AppColors.black,
    // fontFamily: AppFonts.circularStd,
  );
  static TextStyle boldTitleStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 45);

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.light,
    primaryColor: AppColors.black,
    appBarTheme: AppBarTheme(
      toolbarTextStyle: lightText,
      color: Colors.white
    ),
    textTheme: TextTheme(
      bodyText1: lightText,
      bodyText2: lightText,
      labelMedium: lightText,
      caption: lightText,
      button: lightText,
      overline: lightText,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}

const Color greenish = Color.fromRGBO(52, 183, 112, 1);
const Color textColor = Color.fromRGBO(82, 82, 82, 1);
const Color yellowish = Color.fromRGBO(255, 173, 71, 1);
const Color darkBlueish = Color.fromRGBO(78, 84, 94, 1);
const Color redish = Color.fromRGBO(161, 96, 96, 1);
const Color lightBlueish = Color.fromRGBO(98, 199, 236, 1);
const fadedGreenishBackground = Color.fromRGBO(233, 246, 233, 1);


class AppColors {
  static final primaryAppColor = Color.fromARGB(255, 5, 9, 43);
  static final secondaryAppColor = Color(0xFFEDB80A);
  static final whiteColor =      Color.fromARGB(255, 255, 255, 255);
  static final black = Color.fromARGB(0, 0, 0, 0);
  static const lightGrayText = Color(0xff939498);
  static const hintTextColor = Color(0xffA2A3A5);
}
