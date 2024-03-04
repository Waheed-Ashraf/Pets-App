import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';

void showSnackBar(BuildContext context,
    {required Color color, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      // width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      duration: const Duration(seconds: 2),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      content: Center(
        child: Text(
          message,
          style: AppStyles.styleMedium18.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: color,
    ),
  );
}
