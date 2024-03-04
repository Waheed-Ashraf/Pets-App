import 'package:flutter/material.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key, this.onChanged, this.isPassword = false, this.validator});

  final bool? isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.styleMedium18.copyWith(
        color: primaryColor,
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: _isObscured ? true : false,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
          ),
          suffixIcon: widget.isPassword == true
              ? GestureDetector(
                  onTap: _toggleVisibility,
                  child: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: primaryColor,
                  ),
                )
              : null),
    );
  }
}
