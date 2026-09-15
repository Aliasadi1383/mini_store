import 'package:flutter/material.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const StoreAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(theme.onPrimary, BlendMode.srcIn),
              child: Center(child: FlutterLogo(size: 21)),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FLUTTER STORE',
                style: textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(title, style: textTheme.titleLarge),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
