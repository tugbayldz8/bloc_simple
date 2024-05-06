import 'package:bloc_simple/feature/base_screen/presentation/view/base_screen_view.dart';
import 'package:bloc_simple/product/state/container/product_state_manager.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ProductStateManager.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScreenView(),
    );
  }
}
