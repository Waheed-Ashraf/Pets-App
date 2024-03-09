import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Features/BottomNavBar/bottom_nav_bar.dart';
import 'package:pets_app/core/utils/colors.dart';
import 'package:pets_app/core/widgets/custom_button.dart';
import 'package:pets_app/core/widgets/custom_text_field.dart';
import 'package:pets_app/core/widgets/snack_bar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? email, password;

  bool isLoading = false;

  String username = '';

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: AppStyles.styleRegular20,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            onChanged: (data) {
              email = data;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter a valid email';
              } else if (!value.contains('@') || !value.contains('.')) {
                return 'Email must conatains @ and .';
              }

              return null;
            },
          ),
          const SizedBox(height: 15),
          Text(
            'Password',
            style: AppStyles.styleRegular20,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            isPassword: true,
            onChanged: (data) {
              password = data;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter a valid password';
              }

              return null;
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text('Forgot Password?',
                    style:
                        AppStyles.styleMedium16.copyWith(color: primaryColor)),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          SizedBox(
            height: 55,
            child: ModalProgressHUD(
              inAsyncCall: isLoading,
              color: primaryColor,
              progressIndicator: const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              child: CustomButton(
                text: isLoading == true ? '' : 'Login',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await loginUser();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const BottomBarScreen();
                      }));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(
                          context,
                          message: 'User not found',
                          color: Colors.red,
                        );
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(
                          context,
                          message: 'The password is wrong',
                          color: Colors.red,
                        );
                      }
                    } catch (e) {
                      showSnackBar(
                        context,
                        message: 'There was an error',
                        color: Colors.red,
                      );
                    }
                    isLoading = false;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loginUser() async {
    // ignore: unused_local_variable
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
