import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/login_view.dart';
import 'package:pets_app/core/utils/colors.dart';

class AlreadyHaveAccounrWidget extends StatelessWidget {
  const AlreadyHaveAccounrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?', style: AppStyles.styleMedium18),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const LoginView();
            }));
          },
          child: Text('Login',
              style: AppStyles.styleSemiBold20.copyWith(color: primaryColor)),
        ),
      ],
    );
  }
}
