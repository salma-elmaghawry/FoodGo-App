import 'package:flutter/cupertino.dart';
import 'package:foodgo_app/Core/Theme/app_colors.dart';
import 'package:foodgo_app/Core/Theme/app_text_styles.dart';

class CategorySection extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;
  const CategorySection({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              onCategorySelected(index);
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
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
                          color: AppColors.primary.withValues(alpha: 0.25),
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
                  color: isSelected ? AppColors.white : AppColors.grey,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
