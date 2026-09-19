import 'package:flutter/material.dart';

class ProductSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const ProductSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return TextField(
      controller: controller,
      onChanged: onChanged,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: theme.secondary),

        suffixIcon: controller.text.isNotEmpty
            ? IconButton(icon: Icon(Icons.clear), onPressed: onClear)
            : null,
        fillColor: theme.secondary.withValues(alpha: 0.12),
        filled: true,
        hintText: 'Search products by name...',
        hintStyle: textTheme.titleSmall,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: theme.primary, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: theme.onPrimary),
        ),
      ),
    );
  }
}
