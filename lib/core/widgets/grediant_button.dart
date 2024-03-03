import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  TextStyle? textStyle;
  Color? primaryColor;
  double? borderRadius;
  Color? secondaryColor;

  final Function() onPressed;
  GradientButton({
    this.secondaryColor,
    this.borderRadius,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.primaryColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          gradient: LinearGradient(colors: [
            secondaryColor ?? Colors.white,
            primaryColor ?? Theme.of(context).colorScheme.secondary
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
              const EdgeInsets.only(right: 50, left: 50, top: 8, bottom: 8)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 16)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              textStyle ?? const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
