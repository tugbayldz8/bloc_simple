import 'package:bloc_simple/feature/base_screen/presentation/view/base_screen_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BaseScreenView(),
    );
  }
}
