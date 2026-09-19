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

  static void increaseQuantity(CartModels cart) {
    cart.quantity++;
  }

  static void decreaseQuantity(CartModels cart) {
    if (cart.quantity > 1) {
      cart.quantity--;
    }
  }

  static void removeProductCart(CartModels cart, List<CartModels> cartList) {
    cartList.remove(cart);
  }

  static int totalQuantity(List<CartModels> cartList) {
    return cartList.fold(0, (sum, cart) => sum + cart.quantity);
  }

  static double subTotal(List<CartModels> cartList) {
    double total = 0;
    for (var cart in cartList) {
      total += cart.quantity * cart.product.price;
    }
    return total;
  }

  static int discount(double subtotal) {
    switch (subtotal) {
      case <40:
      return 0;
      case <=100:
      return 2;
      case <= 300:
        return 3;
      case <= 500:
        return 5;
      case <= 1400:
        return 10;
      default:
        return 15;
    }
  }

  static double discountAmount(double subtotal,int discount){
   return subtotal*discount/100;
  }

  static int tax(double subtotal) {
    switch (subtotal) {
      case <40:
      return 0;
      case <=100:
      return 1;
      case <= 300:
        return 2;
      case <= 500:
        return 3;
      case <= 1400:
        return 5;
      default:
        return 8;
    }
  }

  static double taxAmount(double subtotal,int tax){
   return subtotal*tax/100;
  }

  static double totalAmount(double subtotal,double discountAmount,double taxAmount){
    return subtotal-discountAmount+taxAmount;
  }
}
