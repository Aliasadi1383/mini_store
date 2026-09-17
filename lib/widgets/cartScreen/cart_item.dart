import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final double price;
  const CartItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _buildCartImage(),

            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCartHeader(context),
                  Text(
                    '\$${price.toStringAsFixed(2)} each',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            name,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          constraints: BoxConstraints(),
          onPressed: () {},
          icon: Icon(Icons.delete_outline),
        ),
      ],
    );
  }

  Widget _buildCartImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
    );
  }
}
