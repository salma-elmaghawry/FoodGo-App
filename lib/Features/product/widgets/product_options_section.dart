import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';
import 'package:foodgo_app/Features/product/widgets/product_option_card.dart';

class ProductOptionModel {
  final String label;
  final String imagePath;

  ProductOptionModel({required this.label, required this.imagePath});
}

class ProductOptionsSection extends StatelessWidget {
  final String title;
  final List<ProductOptionModel> options;

  const ProductOptionsSection({
    super.key,
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Text(title, style: AppTextStyles.poppins24Bold(fontSize: 18)),
        ),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              return ProductOptionCard(
                imagePath: option.imagePath,
                label: option.label,
                onAdd: () {
                  // Add logic here if needed
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
