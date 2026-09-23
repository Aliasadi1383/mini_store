import 'package:mini_store/models/product_models.dart';

class CartItemModel{
  final ProductModels product;
   int quantity;

   CartItemModel({required this.product, required this.quantity});
}
