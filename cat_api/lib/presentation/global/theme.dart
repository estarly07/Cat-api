import 'package:flutter/material.dart';

ThemeData getTheme(bool darkMode){
  if(darkMode){
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: Colors.white,
      backgroundColor: Colors.grey.shade600,
      colorScheme: ColorScheme.dark(
        primary: Colors.white, 
        secondary: Colors.grey.shade400, 
      ),
      textSelectionTheme:const TextSelectionThemeData(
        cursorColor: Colors.white
      ),
    );
  }else{
   return ThemeData.light().copyWith(
      primaryColor: Colors.black,
      backgroundColor: Colors.grey.shade300,
      colorScheme: ColorScheme.light(
        primary: Colors.black, 
        secondary: Colors.grey.shade700, 
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.grey.shade700
      ),
   );
  }
}

class AppColors {
  AppColors._();
  static const primary = Color(0xff1565c0);
  static const dark    = Color(0xff000a12);
  static const darkBackground = Color(0xff102027);
}