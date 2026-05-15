import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controller;
  final int? maxLength;
  final Key? inputKey;

  const CustomInput({
    super.key,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.controller,
    this.maxLength,
    this.inputKey,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: inputKey,
      controller: controller,
      obscureText: obscureText,
      maxLength: maxLength,
      inputFormatters: maxLength != null
          ? [
              LengthLimitingTextInputFormatter(maxLength),
            ]
          : [],
      style: const TextStyle(
        color: AppColors.white,
      ),
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: AppColors.inputBackground,
        labelText: label,
        labelStyle: const TextStyle(
          color: AppColors.white70,
        ),
        prefixIcon: Icon(
          icon,
          color: AppColors.white70,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}