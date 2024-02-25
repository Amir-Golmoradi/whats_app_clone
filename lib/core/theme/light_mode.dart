import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor:
        const Color(0xfff2eee0), // Match accent color for consistency
    titleTextStyle: typoGraphy.textTheme.headlineSmall!.copyWith(
      color: const Color(0xff36382d),
    ),
  ),
  colorScheme: ColorScheme.light(
    background: const Color(0xfffef9eb), // background
    primary: const Color(0xff36382d), // primary texts
    inversePrimary: Colors.grey[500], //subtext
    onPrimary: const Color(0xffF8F4E4), // chat cards
    secondary: const Color(0xFFE1E760), // action button
    surface: Colors.grey[300]!, //Divider
  ),
);
