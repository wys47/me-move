import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainColor = Colors.blueGrey;
final secondaryColorDark = Color(0xFF27242C);

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primarySwatch: mainColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.blueAccent, // formerly known as accentColor
      ),
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
        headlineLarge: GoogleFonts.lato(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.blue),
        headlineSmall: GoogleFonts.openSans(
            fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.yellow),
      ),

    );
  }
}