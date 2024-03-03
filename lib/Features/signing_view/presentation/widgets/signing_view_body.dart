import 'package:flutter/material.dart';
import 'package:pets_app/Features/signing_view/presentation/widgets/custom_button.dart';
import 'package:pets_app/core/app_styles.dart';

class SigningViewBody extends StatelessWidget {
  const SigningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(flex: 4),
          Image.asset(
            'assets/images/cats.png',
          ),
          Text(
            'Loly Pets',
            style: AppStyles.styleSemiBold24,
          ),
          const Spacer(flex: 3),
          const CustomButton(text: 'Login'),
          const SizedBox(
            height: 20,
          ),
          const CustomButton(
            text: 'Register',
            withBorder: true,
            color: Colors.white,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
