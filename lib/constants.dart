import 'package:guzo_go_demo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {

  static String baseUrl = "http://196.188.235.241:8000";
  static const String socketBaseUrl = "http://196.188.235.241:3000";
  static String imagePath = "/uploads/passengers/images/";
  //storage key


static TextStyle forgotPasswordTextstyle = TextStyle(color: AppColors.lightGrayText,fontSize: 8);

static TextStyle boldTextStyle({required double fontSize,Color? color}){
  return GoogleFonts.montserrat(
    color: color?? AppColors.black,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
  );
  
  
}
static TextStyle lightTextStyle( {required double fontSize,Color? color,}){
  return GoogleFonts.montserrat(
    color:color?? AppColors.lightGrayText,
    fontSize: fontSize,
  );
}

}
