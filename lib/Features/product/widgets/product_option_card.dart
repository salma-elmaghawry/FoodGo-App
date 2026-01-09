import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';

class ProductOptionCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onAdd;

  const ProductOptionCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
        color: const Color(
          0xFF3C2F2F,
        ), // Dark background for the bottom label area
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image Area
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          // Label and Button Area
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      label,
                      style: AppTextStyles.poppins16Regular(
                        fontSize: 12,
                        color: Colors.white,
                      ).copyWith(fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: onAdd,
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 14.w),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
