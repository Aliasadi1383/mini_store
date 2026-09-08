import 'package:flutter/material.dart';
import 'package:mini_store/widgets/store_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Products',),
      body: Center(child: Text('data')),
    );
  }
}
