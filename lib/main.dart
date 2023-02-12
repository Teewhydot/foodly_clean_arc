import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/welcome_screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Foodly(),
    );
  }
}
