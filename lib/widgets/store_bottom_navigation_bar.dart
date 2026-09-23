import 'package:flutter/material.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/widgets/cart_badge.dart';

class StoreBottomNavigationBar extends StatelessWidget {
  const StoreBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final appState = AppProvider.of(context);

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
            isSelected: appState.selectedIndex == 0,
            onTap: () {
              appState.goHome();
            },
            hasNewCartItem: appState.showCartBadge,
          ),
          _NavigationItem(
            icon: Icons.shopping_bag_outlined,
            label: 'Cart',
            isSelected: appState.selectedIndex == 1,
            onTap: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              Future.delayed(Duration(milliseconds: 150), () {
                appState.goCart();
              });
            },
            showBadge: true,
            numberItemCart: appState.cartBadgeCount,
            hasNewCartItem: appState.showCartBadge,
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
    required this.hasNewCartItem,
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
                  child: CartBadge(numberItemCart: numberItemCart),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
