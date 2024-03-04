import 'package:flutter/material.dart';
import 'package:pets_app/Core/theme/app_theme.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/signing_view/signing_view.dart';
import 'package:pets_app/Features/BottomNavBar/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMood,
      home: const BottomBarScreen(),
    );
  }
}
