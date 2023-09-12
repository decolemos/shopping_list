import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/components/drawer_menu.dart';
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

  void getProducts() {
    Provider.of<ProductProvider>(context, listen: false).getProductFirebase();
    print("Entrou no initState");
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, 
              icon: const Icon(Icons.menu)
            );
          },
        ),
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
      drawer: const DrawerMenu(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: 0.7
              ), 
              itemCount: provider.productList.length,
              itemBuilder: (context, index) {
                return ProductBanner(
                  product: Product(
                    id: provider.productList[index].id, 
                    name: provider.productList[index].name, 
                    price: provider.productList[index].price,
                    img: provider.productList[index].img
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}