import 'package:mini_store/models/cart_models.dart';

class CartLogic {
  static void addProductCart(CartItemModel cart, List<CartItemModel> cartList) {
    final int index = cartList.indexWhere(
      (element) => element.product.id == cart.product.id,
    );

    if (index == -1) {
      cartList.add(cart);
    } else {
      cartList[index].quantity++;
    }
  }

  static void increaseQuantity(CartItemModel cart) {
    cart.quantity++;
  }

  static void decreaseQuantity(CartItemModel cart) {
    if (cart.quantity > 1) {
      cart.quantity--;
    }
  }

  static void removeProductCart(
    CartItemModel cart,
    List<CartItemModel> cartList,
  ) {
    cartList.remove(cart);
  }

  static int totalQuantity(List<CartItemModel> cartList) {
    return cartList.fold(0, (sum, cart) => sum + cart.quantity);
  }

  static double subTotal(List<CartItemModel> cartList) {
    double total = 0;
    for (var cart in cartList) {
      total += cart.quantity * cart.product.price;
    }
    return total;
  }

  static int discount(double subtotal) {
    switch (subtotal) {
      case < 40:
        return 0;
      case <= 100:
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

  static double discountAmount(double subtotal, int discount) {
    return subtotal * discount / 100;
  }

  static int tax(double subtotal) {
    switch (subtotal) {
      case < 40:
        return 0;
      case <= 100:
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

  static double taxAmount(double subtotal, int tax) {
    return subtotal * tax / 100;
  }

  static double totalAmount(
    double subtotal,
    double discountAmount,
    double taxAmount,
  ) {
    return subtotal - discountAmount + taxAmount;
  }

  static CartItemModel? findCartItem(
    List<CartItemModel> cartList,
    int productId,
  ) {
    return cartList.where((cart) => cart.product.id == productId).firstOrNull;
  }
}
