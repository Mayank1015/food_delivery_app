import 'services/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=> CartProvider(),
      child: Builder(
        builder: (
            BuildContext context) =>
            MaterialApp(
              theme: ThemeData(
                useMaterial3: true,
              ),
              home: const MyHomePage(),
            ),
      ),
    );
  }
}