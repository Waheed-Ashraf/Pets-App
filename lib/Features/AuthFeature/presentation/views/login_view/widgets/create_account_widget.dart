import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';

class CreateAccountWidget extends StatelessWidget {
  const CreateAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?', style: AppStyles.styleMedium18),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {},
          child: Text('Register',
              style: AppStyles.styleSemiBold20.copyWith(color: primaryColor)),
        ),
      ],
    );
  }
}
