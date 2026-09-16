import 'package:flutter/material.dart';
import 'package:mini_store/screens/main_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:  Colors.blue).copyWith(
          primary: const Color(0xFF412CE7),
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F9FF),
        textTheme: TextTheme(

          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          titleMedium:TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color:const Color(0xFF464556)
          ) ,
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
          labelLarge: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF777588),
          ),
          labelMedium: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimary
          )
        ),
      ),
      home: MainScreen(),
      
    );
  }
}