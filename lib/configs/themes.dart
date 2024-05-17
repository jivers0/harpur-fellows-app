import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

final appTheme = ThemeData(
  primaryColor: kPurple,
  textTheme: TextTheme(
      bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: GoogleFonts.nunitoSans().fontFamily)),
  appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: kPurple,
      titleTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: GoogleFonts.nunitoSans().fontFamily,
          fontWeight: FontWeight.bold)),
  scaffoldBackgroundColor: kGold,
);
