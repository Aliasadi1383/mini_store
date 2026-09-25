import 'package:mini_store/data/products_data.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/models/product_models.dart';

class FavoriteLogic {
  static void toggleFavorite(ProductModels product) {
    product.isFavorite = !product.isFavorite;
  }

  static void clearCartFavorite(List<CartItemModel> cartList) {
    for (final CartItemModel cart in cartList) {
      if (cart.product.isFavorite) {
        cart.product.isFavorite = false;
      }
    }
  }

  static bool hasFavorite(){
   return products.any((product) =>product.isFavorite);
  }
}
