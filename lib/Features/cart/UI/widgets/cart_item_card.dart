import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';
import 'package:foodgo_app/Core/widgets/counter.dart';

class CartItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int quantity;
  final void Function() onIncrement;
  final void Function() onDecrement;

  const CartItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              imageUrl,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80.w,
                height: 80.h,
                color: AppColors.lightGrey,
                child: const Icon(Icons.fastfood, color: AppColors.grey),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.poppins16Regular(
                    color: AppColors.black,
                    fontSize: 16,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.poppins16Regular(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Counter(
            quantity: quantity,
            onIncrement: onIncrement,
            onDecrement: onDecrement,
          ),
        ],
      ),
    );
  }
}
