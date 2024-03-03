import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Core/utils/assets_data.dart';
import 'package:pets_app/Core/widgets/custom_button.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/login_view.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/register_view/register_view.dart';

class SigningViewBody extends StatelessWidget {
  const SigningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            CustomButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginView();
                }));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Register',
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const RegisterView();
                }));
              },
              withBorder: true,
              color: Colors.white,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
