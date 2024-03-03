import 'package:flutter/material.dart';
import 'package:pets_app/core/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, this.isPassword = false});

  final bool? isPassword;

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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: _isObscured ? true : false,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            border: InputBorder.none,
            suffixIcon: widget.isPassword == true
                ? GestureDetector(
                    onTap: _toggleVisibility,
                    child: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: primaryColor,
                    ),
                  )
                : null),
      ),
    );
  }
}
