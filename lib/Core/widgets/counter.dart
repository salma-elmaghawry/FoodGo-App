import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';

class Counter extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const Counter({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildStepperIcon(Icons.add, onIncrement),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            '$quantity',
            style: AppTextStyles.poppins16Regular(
              color: AppColors.black,
              fontSize: 16,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        buildStepperIcon(Icons.remove, onDecrement),
      ],
    );
  }
}

Widget buildStepperIcon(IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Icon(icon, color: AppColors.white, size: 20.sp),
    ),
  );
}
