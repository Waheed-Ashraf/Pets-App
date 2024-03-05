import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Core/utils/assets_data.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/register_view/widgets/already_have_account_widget.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/register_view/widgets/register_form.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
            RegisterForm(),
            const SizedBox(height: 16),
            const AlreadyHaveAccounrWidget(),
          ],
        ),
      ),
    );
  }
}
