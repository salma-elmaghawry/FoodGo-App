import 'package:flutter/material.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.radio,
    this.hintText,
    this.prefixIcon,
    this.labelText = '',
    this.isObsecureText,
    this.controller,
    this.onChanged,
    this.validator,
    this.serverErrorText,
    this.suffixIcon,
    this.hasSuffixIcon = false,
    this.hasPrefixIcon = true,
    this.fillcolor = AppColors.textFieldBackground,
    this.borderRadius,
    this.hasShadow = false,
  });

  final void Function(String value)? onChanged;
  final double? radio;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final bool? isObsecureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? serverErrorText;
  final bool hasSuffixIcon;
  final bool hasPrefixIcon;
  final Color fillcolor;
  final double? borderRadius;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 14),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.05),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: SizedBox(
        height: 55,
        child: TextFormField(
          onChanged: onChanged,
          validator: (v) {
            if (serverErrorText != null && serverErrorText!.isNotEmpty) {
              return serverErrorText;
            }
            if (validator != null) {
              return validator!(v);
            }
            if (v == null) {
              return 'Please fill $hintText';
            }
            return null;
          },
          controller: controller,
          obscureText: isObsecureText ?? false,
          cursorColor: AppColors.primary,

          decoration: InputDecoration(
            filled: true,
            fillColor: fillcolor,
            hintText: hintText,
            // labelText: labelText,
            labelStyle: AppTextStyles.poppins16Regular(color: AppColors.grey),
            hintStyle: AppTextStyles.poppins16Regular(color: AppColors.grey),
            prefixIcon: hasPrefixIcon && prefixIcon != null
                ? Padding(padding: EdgeInsets.all(12.0), child: prefixIcon)
                : null,

            suffixIcon: (hasSuffixIcon || suffixIcon != null)
                ? suffixIcon
                : null,

            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
              borderSide: BorderSide(color: AppColors.textFieldBackground),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorText: serverErrorText,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
              borderSide: BorderSide(color: AppColors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
              borderSide: BorderSide(color: AppColors.red, width: 1.5),
            ),
            //fillColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
