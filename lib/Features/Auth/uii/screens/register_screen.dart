import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodgo_app/Core/Helpers/spacing.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_images.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';
import 'package:foodgo_app/Core/shared/custom_button.dart';
import 'package:foodgo_app/Core/shared/custom_password_field.dart';
import 'package:foodgo_app/Core/shared/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  verticalSpace(150),
                  SvgPicture.asset(AppImages.logoSVG, color: AppColors.primary),
                  verticalSpace(15),
                  Text(
                    "Create an account to continue",
                    style: AppTextStyles.poppins16Regular(
                      color: AppColors.primary,
                    ),
                  ),
                  verticalSpace(20),
                  CustomTextFormField(hintText: 'Name'),
                  verticalSpace(20),
                  CustomTextFormField(hintText: 'Email'),
                  verticalSpace(20),
                  CustomPasswordField(hintText: 'Password'),
                  verticalSpace(20),
                  CustomPasswordField(hintText: 'Confirm Password'),
                  verticalSpace(20),
                  CustomButton(
                    title: 'Register',
                    backgroundColor: AppColors.primary,
                    textColor: AppColors.white,
                    onPressed: () {},
                  ),
                  verticalSpace(20),
                  Text(
                    "Don't have an account?",
                    style: AppTextStyles.poppins16Regular(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
