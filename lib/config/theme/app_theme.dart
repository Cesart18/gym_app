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
      centerTitle: true,
      backgroundColor: backgroundColor,
    ),

    tabBarTheme: TabBarTheme(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      dividerColor: backgroundColor,
      indicatorColor: primaryColor,
      indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(
      color: primaryColor,
      width: 2),),
      labelColor: primaryColor,
      unselectedLabelColor: primaryColor.withValues(alpha: 0.6)),


  );

}
