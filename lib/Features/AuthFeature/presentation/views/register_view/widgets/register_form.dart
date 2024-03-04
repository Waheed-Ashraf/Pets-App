// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/register_view/widgets/check_box_widget.dart';
import 'package:pets_app/core/utils/app_styles.dart';
import 'package:pets_app/core/widgets/custom_button.dart';
import 'package:pets_app/core/widgets/custom_text_field.dart';
import 'package:pets_app/core/widgets/snack_bar.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    super.key,
    this.fullName,
    this.email,
    this.password,
    this.confirmPassword,
  });

  String? email;
  String? fullName;
  String? password;
  String? confirmPassword;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          Text(
            'Full Name',
            style: AppStyles.styleRegular16,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            onChanged: (data) {
              fullName = data;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter a valid name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Email',
            style: AppStyles.styleRegular16,
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
          const SizedBox(height: 10),
          Text(
            'Password',
            style: AppStyles.styleRegular16,
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
          Text(
            'Confirm Password',
            style: AppStyles.styleRegular16,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            isPassword: true,
            onChanged: (data) {
              confirmPassword = data;
            },
            validator: (value) {
              if (value != password) {
                return 'Password is\'t matched';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          const CheckboxWidget(),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
              text: 'Register',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await registerUser();
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      showSnackBar(
                        context,
                        message: 'Email already exists',
                        color: Colors.red,
                      );
                    } else if (e.code == 'weak-password') {
                      showSnackBar(
                        context,
                        message: 'The password is too weak',
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
                }
              }),
        ],
      ),
    );
  }

  Future<void> registerUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
