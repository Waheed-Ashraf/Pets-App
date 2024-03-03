import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/register_view/widgets/check_box_widget.dart';
import 'package:pets_app/core/widgets/custom_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: AppStyles.styleRegular16,
        ),
        const SizedBox(height: 8),
        const CustomTextField(),
        const SizedBox(height: 10),
        Text(
          'Email',
          style: AppStyles.styleRegular16,
        ),
        const SizedBox(height: 8),
        const CustomTextField(),
        const SizedBox(height: 10),
        Text(
          'Password',
          style: AppStyles.styleRegular16,
        ),
        const SizedBox(height: 8),
        const CustomTextField(isPassword: true),
        const SizedBox(height: 10),
        Text(
          'Confirm Password',
          style: AppStyles.styleRegular16,
        ),
        const SizedBox(height: 8),
        const CustomTextField(isPassword: true),
        const SizedBox(height: 16),
        const CheckboxWidget(),
      ],
    );
  }
}
