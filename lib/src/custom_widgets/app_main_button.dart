import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_text_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.screenWidth,
    required this.controller,
    required this.onPressed,
    required this.buttonText,
    required this.screenWidthMultiplier,
    required this.height,
  });

  final double screenWidth;
  final GetxController controller;
  final void Function()? onPressed;
  final String buttonText;
  final double screenWidthMultiplier;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: screenWidth * screenWidthMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 1, color: const Color(0xFF2AB3C6)),
        color: const Color(0xFF2AB3C6),
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: buttonTextStyle,
          )),
    );
  }
}
