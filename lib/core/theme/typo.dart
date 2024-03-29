// ignore_for_file: public_member_api_docs, flutter_style_todos

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData typoGraphy = ThemeData(
  textTheme: TextTheme(
    // Consistent and descriptive heading styles
    // Todo: Headline Texts

    headlineLarge:
        GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold),
    headlineMedium:
        GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
    headlineSmall:
        GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
    //^ Todo: Body Texts
    bodyLarge:
        GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
    bodyMedium:
        GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w300),
    bodySmall:
        GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal),

    //* Title Texts
    titleLarge:
        GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w800),
    titleMedium:
        GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700),
  ),
);
