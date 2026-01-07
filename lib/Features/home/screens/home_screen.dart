import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodgo_app/Core/Helpers/spacing.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_images.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';
import 'package:foodgo_app/Core/shared/custom_text_field.dart';
import 'package:foodgo_app/Features/home/widgets/category_section.dart';
import 'package:foodgo_app/Features/home/widgets/food_card.dart';
import 'package:foodgo_app/Features/home/widgets/home_header.dart';
import 'package:foodgo_app/Features/home/widgets/search_section.dart';

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

  final List<Map<String, String>> foodItems = [
    {
      'title': "Cheeseburger",
      'subtitle': "Wendy's Burger",
      'rating': "4.9",
      'image': "assets/test/test.png",
    },
    {
      'title': "Hamburger",
      'subtitle': "Veggie Burger",
      'rating': "4.8",
      'image': "assets/test/test.png",
    },
    {
      'title': "Hamburger",
      'subtitle': "Chicken Burger",
      'rating': "4.6",
      'image': "assets/test/test.png",
    },
    {
      'title': "Hamburger",
      'subtitle': "Fried Chicken",
      'rating': "4.5",
      'image': "assets/test/test.png",
    },
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
              HomeHeader(),
              verticalSpace(20),

              ///search
              SearchSection(),
              verticalSpace(20),

              ///Categories
              CategorySection(
                categories: categories,
                selectedIndex: selectedIndex,
                onCategorySelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              verticalSpace(20),

              ///Card item
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    final item = foodItems[index];
                    return FoodCard(
                      title: item['title']!,
                      subtitle: item['subtitle']!,
                      rating: item['rating']!,
                      imagePath: item['image']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
