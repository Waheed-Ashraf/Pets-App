import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Core/utils/assets_data.dart';
import 'package:pets_app/Core/widgets/custom_button.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/widgets/create_account_widget.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/widgets/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 4),
          Center(
            child: Column(
              children: [
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
              ],
            ),
          ),
          const Spacer(flex: 3),
          const LoginForm(),
          const Spacer(flex: 3),
          CustomButton(text: 'Login', onPressed: () {}),
          const Spacer(),
          const CreateAccountWidget(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
