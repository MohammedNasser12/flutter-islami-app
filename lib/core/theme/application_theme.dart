import 'package:flutter/material.dart';

class ApplicationThemeData {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color primaryDarkColor = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            color: Color(0xFF242424),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "ElMessiri")),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ApplicationThemeData.primaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color(0xFFFFFFFF),
        selectedItemColor: Color(0xFF242424),
        selectedLabelStyle: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 20,
          fontWeight: FontWeight.w600,
        )),
    dividerTheme: DividerThemeData(
      color: primaryColor,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xFF242424),
        fontSize: 25,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: Color(0xFF242424),
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      titleLarge: TextStyle(
          color: Color(0xFF242424),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: "ElMessiri"),
      titleMedium: TextStyle(
        fontFamily: "ElMessiri",
        color: Color(0xFF242424),
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 25, fontFamily: "ELMessiri"))),
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: primaryDarkColor),
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "ElMessiri"),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF141A2E),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(0xFFFFFFFF),
          selectedItemColor: primaryDarkColor,
          selectedLabelStyle: TextStyle(
            fontFamily: "ElMessiri",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
      dividerTheme: DividerThemeData(
        color: primaryDarkColor,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "ElMessiri"),
        titleMedium: TextStyle(
          fontFamily: "ElMessiri",
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryDarkColor,
              foregroundColor: Colors.black,
              textStyle: TextStyle(fontSize: 25, fontFamily: "ELMessiri"))));
}
