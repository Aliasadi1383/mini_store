import 'package:flutter/material.dart';
import 'package:mini_store/models/product_models.dart';
import 'package:mini_store/widgets/app_gradient_button.dart';

class ProductCategoryFilter extends StatelessWidget {
  final Categories? selectedCategory;
  final ValueChanged<Categories?> onCategorySelected;
  const ProductCategoryFilter({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final  ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      physics:const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 15,),
          categoryItem(
            title: 'All',
            isSelected: selectedCategory == null,
            onTap: () {
              onCategorySelected(null);
            },
            icon: Icons.apps_outlined,
            theme: theme,
            textTheme: textTheme,
          ),
          ...Categories.values.map((category) {
            return categoryItem(
              title:
                  category.name[0].toUpperCase() + category.name.substring(1),
              isSelected: selectedCategory == category,
              onTap: () {
                onCategorySelected(category);
              },
    
              icon: setIcon(category),
              theme: theme,
              textTheme: textTheme,
            );
            
          }),
          const SizedBox(width: 15,)
        ],
      ),
    );
  }

  IconData setIcon(Categories category) {
    switch (category) {
      case Categories.food:
        return Icons.lunch_dining;
      case Categories.electronics:
        return Icons.devices;
      case Categories.clothing:
        return Icons.checkroom;
      case Categories.homeAppliances:
        return Icons.kitchen;
    }
  }

  Widget categoryItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required IconData icon,
    required ColorScheme theme,
    required TextTheme textTheme,
  }) {
    return Padding(
      padding:const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 36,
          decoration: BoxDecoration(
            color: isSelected ? null : theme.secondary.withValues(alpha: 0.18),
            gradient: isSelected ? AppGradientButton.primaryButton : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? theme.onPrimary : theme.secondary,
              ),
              const SizedBox(width:3),
              Text(
                title,
                style: isSelected
                    ? textTheme.labelMedium
                    : textTheme.labelMedium!.copyWith(color: theme.secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
