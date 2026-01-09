import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';
import 'package:foodgo_app/Core/widgets/counter.dart';

class ProductHeaderSection extends StatefulWidget {
  final int portionCount;
  final void Function() onIncrement;
  final void Function() onDecrement;
  const ProductHeaderSection({
    super.key,
    required this.portionCount,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<ProductHeaderSection> createState() => _ProductHeaderSectionState();
}

class _ProductHeaderSectionState extends State<ProductHeaderSection> {
  double _spicyValue = 2.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            flex: 4,
            child: Image.asset(
              "assets/test/food.png",
              fit: BoxFit.contain,
              height: 350.h,
            ),
          ),
          SizedBox(width: 20.w),
          // Customization Controls
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Customize ",
                        style: AppTextStyles.poppins24Bold(
                          fontSize: 18,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "Your Burger to Your Tastes. Ultimate Experience",
                        style: AppTextStyles.poppins16Regular(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                // Spicy Slider
                Text("Spicy", style: AppTextStyles.poppins24Bold(fontSize: 18)),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 6.h,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.r),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20.r),
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.lightGrey,
                    thumbColor: AppColors.primary,
                  ),
                  child: Slider(
                    value: _spicyValue,
                    min: 1,
                    max: 3,
                    onChanged: (value) {
                      setState(() {
                        _spicyValue = value;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mild",
                      style: AppTextStyles.poppins16Regular(
                        fontSize: 14,
                        color: AppColors.green,
                      ),
                    ),
                    Text(
                      "Hot",
                      style: AppTextStyles.poppins16Regular(
                        fontSize: 14,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                // Portion Counter
                Text(
                  "Portion",
                  style: AppTextStyles.poppins24Bold(fontSize: 18),
                ),
                SizedBox(height: 10.h),
                // Portion Counter
                Counter(
                  quantity: widget.portionCount,
                  onIncrement: widget.onIncrement,
                  onDecrement: widget.onDecrement,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
