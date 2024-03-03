import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,
    {required Color color, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      // width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      duration: const Duration(seconds: 2),
      content: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: color,
    ),
  );
}
