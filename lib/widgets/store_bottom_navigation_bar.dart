import 'package:flutter/material.dart';
import 'package:mini_store/widgets/cart_badge.dart';

class StoreBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final int numberItemCart;
  final bool hasNewCartitem;
  const StoreBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.numberItemCart,
    required this.hasNewCartitem
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: BoxBorder.fromLTRB(
          top: BorderSide(
            color: theme.secondary.withValues(alpha: 0.6),
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
            hasNewCartItem: hasNewCartitem,
          ),
          _NavigationItem(
            icon: Icons.shopping_bag_outlined,
            label: 'Cart',
            isSelected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
            showBadge: true,
            numberItemCart: numberItemCart,
            hasNewCartItem: hasNewCartitem,
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
  final bool showBadge;
  final int numberItemCart;
  final bool hasNewCartItem;
  const _NavigationItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.showBadge = false,
    this.numberItemCart = 0,
    required this.hasNewCartItem
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    Icon(
                      icon,
                      color: isSelected ? theme.primary : theme.secondary,
                    ),
                    Text(
                      label,
                      style: textTheme.labelMedium!.copyWith(
                        color: isSelected ? theme.primary : theme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (showBadge && hasNewCartItem)
                Positioned(
                  top: 2,
                  right: 14,
                  child: CartBadge(numberItemCart: numberItemCart)
                ),
            ],
          ),
        ),
      ),
    );
  }
}
