import 'package:flutter/material.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/widgets/cartScreen/cart_empty.dart';
import 'package:mini_store/widgets/cartScreen/cart_item.dart';
import 'package:mini_store/widgets/cartScreen/cart_state_info.dart';
import 'package:mini_store/widgets/cartScreen/cart_summary.dart';
import 'package:mini_store/widgets/store_app_bar.dart';
import 'package:mini_store/widgets/cartScreen/cart_header.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onGoHome;
  final List<CartModels> cartList;
  final ValueChanged<CartModels> onIncrease;
  final ValueChanged<CartModels> onDecrease;
  final ValueChanged<CartModels> onDeleted;
  final VoidCallback onDeleteAll;
  final int totalCartQuantity;
  final double subTatal;
  final int discount;
  final int tax;
  final double discountAmount;
  final double taxAmount;
  final double totalAmount;
  final VoidCallback onSubmitOrder;
  const CartScreen({
    super.key,
    required this.onGoHome,
    required this.cartList,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDeleted,
    required this.onDeleteAll,
    required this.totalCartQuantity,
    required this.subTatal,
    required this.discount,
    required this.discountAmount,
    required this.tax,
    required this.taxAmount,
    required this.totalAmount,
    required this.onSubmitOrder
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Cart'),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                CartHeader(
                  onBack: onGoHome,
                  productQuantity: cartList.length,
                  isEmptyCart: cartList.isEmpty,
                  onDeleteAll: onDeleteAll,
                ),
                const SizedBox(height: 24),
                CartStateInfo(),
                
                if(cartList.isNotEmpty) ...[
                  const SizedBox(height: 12),

                  ...cartList.map((cart) {
                    return CartItem(
                      cart: cart,
                      onDecrease: onDecrease,
                      onIncrease: onIncrease,
                      onDeleted: onDeleted,
                    );
                  }),
                  const SizedBox(height: 12),
                  CartSummary(
                    numberCartItem: cartList.length,
                    totalCartQuantity: totalCartQuantity,
                    subTotal: subTatal,
                    discount: discount,
                    discountAmount: discountAmount,
                    tax: tax,
                    taxAmount: taxAmount,
                    totalAmount: totalAmount,
                    onSubmitOrder: onSubmitOrder,
                  ),
                ],
              ]),
            ),
          ),
          if (cartList.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CartEmpty(onExploreProducts: onGoHome)),
            ),
        ],
      ),
    );
  }
}
