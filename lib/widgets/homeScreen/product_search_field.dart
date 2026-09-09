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
    return TextField(
      controller: controller,
      onChanged: onChanged,

      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.secondary,
        ),
        
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(icon: Icon(Icons.clear), onPressed: onClear)
            : null,
        fillColor: Theme.of(
          context,
        ).colorScheme.secondary.withValues(alpha: 0.12),
        filled: true,
        hintText: 'Search products by name...',
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
