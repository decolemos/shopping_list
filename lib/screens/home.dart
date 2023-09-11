import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/components/product_banner.dart';
import 'package:shopping_list/models/product.dart';
import 'package:shopping_list/provider/product_provider.dart';
import 'package:shopping_list/screens/shopping_car.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String, dynamic>> productList = [
    {
      "id": Random().nextInt(10),
      "name": "Sea of Stars",
      "price": 200.00,
      "img": "assets/armored_core.png"
    },
    {
      "id": Random().nextInt(10),
      "name": "Baldurs Gate 3",
      "price": 200.00,
      "img": "assets/baldurs_gate.png"
    },
    {
      "id": Random().nextInt(10),
      "name": "Blasphemous 2",
      "price": 200.00,
      "img": "assets/blasphemous_dois.png"
    },
    {
      "id": Random().nextInt(10),
      "name": "FC 24",
      "price": 200.00,
      "img": "assets/fc24.png"
    },
    {
      "id": Random().nextInt(10),
      "name": "Fortnite",
      "price": 200.00,
      "img": "assets/fortnite.png"
    },
    {
      "id": Random().nextInt(10),
      "name": "Humankind",
      "price": 200.00,
      "img": "assets/humankind.png"
    },
    {
      "id": Random().nextInt(10),
      "name": "Massacre",
      "price": 200.00,
      "img": "assets/massacre.png"
    },
    {
      "id": Random().nextInt(10),
      "name": "Mortal Kombat 1",
      "price": 200.00,
      "img": "assets/mk_um.png"
    },
    {
      "id": Random().nextInt(10),
      "name": "Read Dead Remaster",
      "price": 200.00,
      "img": "assets/red_dead.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loja"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const ShoppingCar(),
              ));
            }, 
            icon: const Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 0.7
          ), 
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductBanner(
              product: Product(
                id: productList[index]["id"], 
                name: productList[index]["name"], 
                price: productList[index]["price"],
                img: productList[index]["img"]
              ),
            );
          },
        ),
      ),
    );
  }
}