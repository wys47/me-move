import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainColor = Colors.black87;

Color getLighterColor(Color color, double lightness) {
  final lighterHslColor = HSLColor.fromColor(color).withLightness(lightness);
  return lighterHslColor.toColor();
}

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: mainColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.blueAccent, // formerly known as accentColor
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: mainColor,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.black54),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor, // Background color
          foregroundColor: Colors.white, // Text color
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: mainColor, // Text color
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: mainColor, // FloatingActionButton 색상 설정
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.notoSans(
            fontSize: 26.0, fontWeight: FontWeight.w300, color: Colors.blue),
        headlineMedium: GoogleFonts.notoSans(
            fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.black),
      ),


    );
  }
}