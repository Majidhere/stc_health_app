import 'package:flutter/material.dart';
import '../theme/app_text_theme.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLength;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.validator,
    this.suffixIcon,
    required this.obscureText,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLength,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: hintTextStyle,
        labelText: labelText,
        labelStyle: labelTextStyle,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
