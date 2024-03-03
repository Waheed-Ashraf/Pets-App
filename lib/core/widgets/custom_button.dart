import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.color = primaryColor,
      this.withBorder = false,
      required this.onPressed});

  final String text;
  final Color? color;
  final bool withBorder;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: withBorder
              ? const BorderSide(color: primaryColor, width: 3)
              : BorderSide.none),
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: AppStyles.styleRegular20.copyWith(
          color: color == primaryColor ? Colors.white : primaryColor,
        ),
      ),
    );
  }
}
