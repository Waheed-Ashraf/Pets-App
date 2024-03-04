import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';
import 'package:pets_app/core/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: AppStyles.styleRegular20,
        ),
        const SizedBox(height: 8),
        const CustomTextField(),
        const SizedBox(height: 15),
        Text(
          'Password',
          style: AppStyles.styleRegular20,
        ),
        const SizedBox(height: 8),
        const CustomTextField(
          isPassword: true,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text('Forgot Password?',
                  style: AppStyles.styleMedium16.copyWith(color: primaryColor)),
            ),
          ],
        ),
      ],
    );
  }
}
