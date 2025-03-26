import 'package:flutter/material.dart';
import 'package:gym_app/config/constants/theme_constants.dart';


class AppTheme {


  ThemeData getTheme() => ThemeData(
    fontFamily: primaryFontFamily,

    scaffoldBackgroundColor: backgroundColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light, 
      primary: primaryColor, 
      onPrimary: backgroundColor, 
      secondary: secondaryColor, 
      onSecondary: primaryColor, 
      error: Colors.red, 
      onError: backgroundColor, 
      surface: backgroundColor, 
      onSurface: textColor,
      ),


    appBarTheme: const AppBarTheme(
      centerTitle: true
    )


  );

}
