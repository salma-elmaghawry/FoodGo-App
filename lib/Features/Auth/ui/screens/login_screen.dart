import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markatty/Core/Helpers/spacing.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_images.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';
import 'package:markatty/Core/shared/custom_button.dart';
import 'package:markatty/Core/shared/custom_password_field.dart';
import 'package:markatty/Core/shared/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  verticalSpace(200),
                  SvgPicture.asset(AppImages.logoSVG, color: AppColors.primary),
                  verticalSpace(20),
                  Text(
                    "Welcome Back to FoodGo!",
                    style: AppTextStyles.poppins16Regular(
                      color: AppColors.primary,
                    ),
                  ),
                  verticalSpace(20),

                  verticalSpace(20),
                  CustomTextFormField(hintText: 'Email', labelText: 'Email'),
                  verticalSpace(20),
                  CustomPasswordField(
                    hintText: 'Password',
                    labelText: 'Password',
                  ),
                  verticalSpace(20),
                  CustomButton(
                    title: 'Login',
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
