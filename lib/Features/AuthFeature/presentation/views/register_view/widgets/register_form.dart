// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/login_view/login_view.dart';
import 'package:pets_app/Features/AuthFeature/presentation/views/register_view/widgets/check_box_widget.dart';
import 'package:pets_app/core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';
import 'package:pets_app/core/widgets/custom_button.dart';
import 'package:pets_app/core/widgets/custom_text_field.dart';
import 'package:pets_app/core/widgets/snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterForm extends StatefulWidget {
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

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
              widget.fullName = data;
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
              widget.email = data;
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
              widget.password = data;
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
              widget.confirmPassword = data;
            },
            validator: (value) {
              if (value != widget.password) {
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
                  text: isLoading == true ? '' : 'Register',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        showSnackBar(
                          context,
                          message: 'Account created successfully',
                          color: Colors.green,
                        );
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginView();
                        }));
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
                      isLoading = false;
                      setState(() {});
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> registerUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: widget.email!,
      password: widget.password!,
    );
    // Store additional user information (username) in Firestore
    await _firestore.collection('users').doc(credential.user!.uid).set({
      'email': widget.email,
      'username': widget.fullName,
    });
  }
}
