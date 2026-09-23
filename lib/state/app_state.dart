import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier{
  int selectedIndex=0;
  int cartBadgeCount=0;
  bool showCartBadge=false;
   void goHome() {
    selectedIndex=0;
    notifyListeners();
  }

  void goCart() {
    selectedIndex=1;
    showCartBadge=false;
    cartBadgeCount=0;
    notifyListeners();
  }

  void cartAdded() {
  cartBadgeCount++;
  showCartBadge=true;
  notifyListeners();
}
}

