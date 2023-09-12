import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_list/models/product.dart';
import 'package:shopping_list/models/shopp_cart.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {

  List<Product> productList = [];
  List<ShoppCar> listShoppingCar = [];
  double valueTotal = 0.0;
  final String url = "https://shoppinglist-cc9df-default-rtdb.firebaseio.com";
  // Product? product;

  Future<void> getProductFirebase() async {

    final response = await http.get(Uri.parse("$url/listCover.json"));
    final jsonResponse = jsonDecode(response.body);

    print(jsonResponse);
    print(response.statusCode);

  if(jsonResponse == null) return;

  for(final key in jsonResponse.keys) {
    Product product = Product(
      id: key, 
      name: jsonResponse[key]["gameName"], 
      price: jsonResponse[key]["price"], 
      img: jsonResponse[key]["url"]
    );

    productList.add(product);
  }

  notifyListeners();
}

  Future<void> addProductFirebase(String name, double price, String img) async {
    final response = await http.post(
      Uri.parse("$url/listCover.json"),
      body: jsonEncode({
        "gameName": name,
        "price": price,
        "url": img
      })
    );

    if(response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final id = jsonResponse["name"];

      Product newProduct = Product(
        id: id, 
        name: name, 
        price: price, 
        img: img
      );

      productList.add(newProduct);
    }

    notifyListeners();
  }

  void addProductShoppingCar(String id, String name, double price, String img) {
    listShoppingCar.add(ShoppCar(
      idCart: Random().nextInt(9999), 
      product: Product(
        id: id, 
        name: name,
        price: price,
        img: img
      )
    ));
   
    print("produto adicionado");

    valueTotal += price;

    notifyListeners();

  }

  void removeProduct(int idCart, double price) {
    listShoppingCar.removeWhere((product) => product.idCart == idCart);

    valueTotal -= price;

    notifyListeners();
  }

  Future<void> removeProductFirebase(String id) async {
    await http.delete(Uri.parse("$url/listCover/$id.json"));

    productList.removeWhere((product) => product.id == id,);

    notifyListeners();

  }


  void finalizePurchase() {
    listShoppingCar = [];

    if(listShoppingCar.isEmpty) {
      valueTotal = 0.0;
    }

    // removeProductFirebase(id);

    notifyListeners();
  }
}