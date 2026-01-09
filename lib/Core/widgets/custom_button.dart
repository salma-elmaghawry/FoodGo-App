import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.poppins24Bold(
            color: textColor ?? AppColors.white,
            fontSize: fontSize ?? 20.sp,
          ),
        ),
      ),
    );
  }
}
