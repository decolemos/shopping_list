import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_list/models/product.dart';
import 'package:shopping_list/models/shopp_cart.dart';

class ProductProvider extends ChangeNotifier {

  List<ShoppCar> listShoppingCar = [];

  void addProductShoppingCar(int id, String name, double price, String img) {
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

    notifyListeners();

  }

  void removeProduct(int idCart) {
    listShoppingCar.removeWhere((product) => product.idCart == idCart);

    notifyListeners();
  }



}