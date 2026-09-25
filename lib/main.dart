import 'package:flutter/material.dart';
import 'package:mini_store/screens/main_screen.dart';
import 'package:mini_store/state/app_scope.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:  Colors.blue).copyWith(
            primary: const Color(0xFF412CE7),
          ),
          scaffoldBackgroundColor: const Color(0xFFF9F9FF),
          textTheme: TextTheme(
      
            titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            titleMedium:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
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
            ),
            titleSmall: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w400, 
            )
          ),
        ),
        home: MainScreen(),
        
      ),
    );
  }
}