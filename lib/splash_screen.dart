import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markatty/Core/Helpers/spacing.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_images.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(20),
          SvgPicture.asset(AppImages.logoSVG),

          Text(
            'FoodGo',
            style: AppTextStyles.quicksand24Bold(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
