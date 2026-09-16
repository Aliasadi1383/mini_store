import 'package:flutter/material.dart';

class StoreBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  const StoreBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
  final ColorScheme theme = Theme.of(context).colorScheme;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: BoxBorder.fromLTRB(
          top: BorderSide(
            color: theme.secondary.withValues(alpha:0.6),
            width: 0.2,
          ),
        ),
        color: theme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavigationItem(
            icon: Icons.storefront,
            label: 'Products',
            isSelected: selectedIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          _NavigationItem(
            icon: Icons.shopping_bag_outlined,
            label: 'Cart',
            isSelected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  const _NavigationItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            height: 56,
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.tertiaryFixedDim.withValues(alpha: 0.5)
                  : null,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: isSelected ? theme.primary : theme.secondary),
                Text(
                  label,
                  style: textTheme.labelMedium!.copyWith(
                    color: isSelected ? theme.primary : theme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
