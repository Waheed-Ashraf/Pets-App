import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pets_app/Core/utils/assets_data.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/widgets/create_account_widget.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/widgets/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16, right: 16, top: MediaQuery.sizeOf(context).height * 0.15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Center(
                child: Image.asset(
                  AssetsData.launchingScreenImg,
                  fit: BoxFit.contain,
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
            const CreateAccountWidget(),
          ],
        ),
      ),
    );
  }
}
