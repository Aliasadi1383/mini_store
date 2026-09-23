import 'package:flutter/foundation.dart';
import 'package:mini_store/logics/cart_logic.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/models/product_models.dart';

class CartState extends ChangeNotifier {

  List<CartItemModel> cartList = [];


  void increaseQuantity(CartItemModel cart) {
    CartLogic.increaseQuantity(cart);
    notifyListeners();
  }

  void decreaseQuantity(CartItemModel cart) {
    CartLogic.decreaseQuantity(cart);
    notifyListeners();
  }

  void addCart(ProductModels product) {
    CartLogic.addProductCart(
      CartItemModel(product: product, quantity: 1),
      cartList,
    );

    notifyListeners();
  }

  void removeCart(CartItemModel cart) {
    CartLogic.removeProductCart(cart, cartList);
    notifyListeners();
  }

  void deleteAllCart() {
    cartList = [];
    notifyListeners();
  }
}
