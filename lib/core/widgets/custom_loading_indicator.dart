import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator(
      {super.key, required this.hight, required this.loadingImg});

  final double hight;
  final String loadingImg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight,
      child: Center(
          child: Lottie.asset(loadingImg,
              width: 100, height: 100, fit: BoxFit.contain)),
    );
  }
}
