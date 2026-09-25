import 'package:flutter/material.dart';
import 'package:mini_store/logics/favorite_logic.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/models/product_models.dart';

class FavoriteState extends ChangeNotifier{
  void toggleFavorite(ProductModels product){
     FavoriteLogic.toggleFavorite(product);
     notifyListeners();
  }
 
 void clearCartFavorite(List<CartItemModel> cartList){
  FavoriteLogic.clearCartFavorite(cartList);
  notifyListeners();
 }

 bool hasFavorite(){
  return FavoriteLogic.hasFavorite();
 }
}