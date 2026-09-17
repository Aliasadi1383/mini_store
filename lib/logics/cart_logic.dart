import 'package:mini_store/models/cart_models.dart';

class CartLogic {
  static void addProductCart(CartModels cart, List<CartModels> cartList) {
    final int index = cartList.indexWhere(
      (element) => element.product.id == cart.product.id,
    );

    if (index == -1) {
      cartList.add(cart);
    } else {
      cartList[index].quantity++;
    }
  }
  
  static void increaseQuantity(CartModels cart){
  cart.quantity++;
  }

  static void decreaseQuantity(CartModels cart){
  if (cart.quantity>1) {
    cart.quantity--;
  }
  }

  static void removeProductCart(CartModels cart,List<CartModels> cartList){
  cartList.remove(cart);
  }
}
