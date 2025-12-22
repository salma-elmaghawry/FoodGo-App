import 'package:flutter/material.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.poppins24Bold(
            color: textColor ?? AppColors.primary,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
