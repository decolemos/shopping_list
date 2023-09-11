import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/provider/product_provider.dart';
import 'package:shopping_list/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}