import 'package:flutter/material.dart';
import 'app_state.dart';

class AppProvider extends InheritedNotifier<AppState> {
  const AppProvider({
    super.key,
    required AppState appState,
    required super.child,
  }) : super(notifier: appState);

  static AppState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppProvider>()!
        .notifier!;
  }
}