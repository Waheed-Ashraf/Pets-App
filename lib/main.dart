import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pets_app/Core/theme/app_theme.dart';
import 'package:pets_app/Core/utils/service_locator.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/signing_view/signing_view.dart';
import 'package:pets_app/Features/BottomNavBar/bottom_nav_bar.dart';
import 'package:pets_app/Features/Cats/presentation/views/cats_view.dart';
import 'package:pets_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: lightMood,
      home: const BottomBarScreen(),
    );
  }
}
