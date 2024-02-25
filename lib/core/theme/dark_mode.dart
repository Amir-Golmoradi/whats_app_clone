import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor:
        const Color(0xFF202021), // Match accent color for consistency
    titleTextStyle: typoGraphy.textTheme.headlineSmall,
  ),
  colorScheme: ColorScheme.dark(
    background: const Color(0xFF202021), // background
    primary: const Color(0xffD9E5CA), // primary texts
    inversePrimary: Colors.grey[500], // texts
    onPrimary: const Color(0xff252525), // chat cards
    secondary: const Color(0xFFFCC419), // action button
    surface: const Color(0xFF202021), // Dividers
  ),
);
