import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';

void showSnackBar(context, {required Color color, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      content: Center(
        child: Text(
          message,
          style: AppStyles.styleMedium14.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: color,
    ),
  );
}
