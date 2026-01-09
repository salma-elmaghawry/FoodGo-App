import 'package:flutter/cupertino.dart';
import 'package:foodgo_app/Core/Helpers/spacing.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/widgets/custom_text_field.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            fillcolor: AppColors.white,
            hasShadow: true,
            hintText: 'Search',
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: AppColors.black,
            ),
            borderRadius: 15,
          ),
        ),
        horizontalSpace(15),
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            CupertinoIcons.slider_horizontal_3,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
