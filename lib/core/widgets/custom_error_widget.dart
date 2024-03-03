import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: AppStyles.styleSemiBold18.copyWith(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
