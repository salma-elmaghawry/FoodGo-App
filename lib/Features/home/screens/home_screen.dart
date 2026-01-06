import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodgo_app/Core/Helpers/spacing.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_images.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';
import 'package:foodgo_app/Core/shared/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> categories = [
    'All',
    'Combos',
    'Sliders',
    'Classic',
    'Pizza',
    'Burger',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              verticalSpace(70),

              ///header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppImages.logoSVG,
                        height: 45,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        'Order your favourite food!',
                        style: AppTextStyles.poppins16Regular(),
                      ),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(AppImages.girlInHome),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(20),

              ///search
              Row(
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
              ),
              verticalSpace(20),

              ///Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    bool isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 45,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textFieldBackground,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.25,
                                    ),
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          categories[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.poppins16Regular(
                            color: isSelected
                                ? AppColors.white
                                : AppColors.grey,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
