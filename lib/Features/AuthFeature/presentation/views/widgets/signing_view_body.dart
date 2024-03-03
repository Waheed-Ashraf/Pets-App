import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Core/utils/assets_data.dart';
import 'package:pets_app/Core/widgets/custom_button.dart';

class SigningViewBody extends StatelessWidget {
  const SigningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(flex: 4),
          SizedBox(
            height: 150,
            child: Image.asset(
              AssetsData.launchingScreenImg,
              fit: BoxFit.contain,
            ),
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
