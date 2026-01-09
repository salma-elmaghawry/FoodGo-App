import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';

class BottomOrderBar extends StatelessWidget {
  final String price;
  final VoidCallback onOrder;

  const BottomOrderBar({super.key, required this.price, required this.onOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, -5),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: AppTextStyles.poppins24Bold(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$",
                      style: AppTextStyles.poppins24Bold(
                        fontSize: 18,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      price,
                      style: AppTextStyles.poppins24Bold(fontSize: 32),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: onOrder,
              child: Container(
                width: 200.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  "ORDER NOW",
                  style: AppTextStyles.poppins24Bold(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
