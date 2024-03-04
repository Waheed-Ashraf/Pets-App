import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Core/utils/assets_data.dart';
import 'package:pets_app/Core/widgets/custom_button.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/widgets/create_account_widget.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/widgets/login_form.dart';
import 'package:pets_app/Features/BottomNavBar/bottom_nav_bar.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16, right: 16, top: MediaQuery.sizeOf(context).height * 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SingleChildScrollView(
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
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          const LoginForm(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          CustomButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const BottomBarScreen();
                }));
              }),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          const CreateAccountWidget(),
        ],
      ),
    );
  }
}
