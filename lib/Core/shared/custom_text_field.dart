import 'package:flutter/material.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.radio,
    this.hintText,
    this.prefixIcon,
    this.labelText,
    this.isObsecureText,
    this.controller,
    this.onChanged,
    this.validator,
    this.serverErrorText,
    this.suffixIcon,
    this.hasSuffixIcon = false,
    this.hasPrefixIcon = true,
    this.fillcolor = AppColors.textFieldBackground,
  });

  final void Function(String value)? onChanged;
  final double? radio;
  final String? hintText;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final bool? isObsecureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? serverErrorText;
  final bool hasSuffixIcon;
  final bool hasPrefixIcon;
  final Color fillcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        onChanged: onChanged,
        validator: (v) {
          if (serverErrorText != null && serverErrorText!.isNotEmpty)
            return serverErrorText;
          if (validator != null) return validator!(v);
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
              ? Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    prefixIcon!,
                    width: 24,
                    height: 24,
                    color: Colors.grey[600],
                  ),
                )
              : null,

          suffixIcon: (hasSuffixIcon || suffixIcon != null) ? suffixIcon : null,

          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.textFieldBackground),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          ),
          errorText: serverErrorText,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.red, width: 1.5),
          ),
          //fillColor: AppColors.white,
        ),
      ),
    );
  }
}
