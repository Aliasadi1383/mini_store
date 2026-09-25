import 'package:flutter/material.dart';
import 'package:mini_store/state/favorite_state.dart';

class FavoriteProvider extends InheritedNotifier<FavoriteState>{
  const FavoriteProvider({
    super.key,
    required FavoriteState favoriteState,
    required super.child
  }):super (notifier: favoriteState);

  static FavoriteState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FavoriteProvider>()!.notifier!;
  }
}
