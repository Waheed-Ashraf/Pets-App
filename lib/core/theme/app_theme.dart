import 'package:flutter/material.dart';

ThemeData lightMood = ThemeData(
  colorScheme: ColorScheme.dark(
    background: const Color(0xffFFE4B5),
    primary: const Color(0xffD9832C),
    secondary: const Color(0xffE3A456),
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
    onPrimary: Colors.white,
  ),
);

ThemeData darkMood = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.black,
    secondary: const Color(0xffFFB039),
    tertiary: Colors.grey.shade200,
    inversePrimary: Colors.grey.shade300,
    onPrimary: Colors.black,
  ),
);
