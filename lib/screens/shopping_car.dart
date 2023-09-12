// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/components/list_shopp_cart.dart';
import 'package:shopping_list/provider/product_provider.dart';

class ShoppingCar extends StatefulWidget {

  // final int id;

  const ShoppingCar({
    Key? key,
    // required this.id,
  }) : super(key: key);

  @override
  State<ShoppingCar> createState() => _ShoppingCarState();
}

class _ShoppingCarState extends State<ShoppingCar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho de compras"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: provider.listShoppingCar.isEmpty
            ? const Center(
              child: Text("Carrinho de compras vazio"),
            )
            : ListView.builder(
              itemCount: provider.listShoppingCar.length,
              itemBuilder: (context, index) {
                return ListShoppCart(
                  idCart: provider.listShoppingCar[index].idCart,
                  product: provider.listShoppingCar[index].product,
                );
              },
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.all(15),
            color: Colors.grey[350],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Valor total da compra: "),
                    Text("R\$${provider.valueTotal.toStringAsFixed(2)}")
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      provider.finalizePurchase();
                      Navigator.pop(context);
                    }, 
                    child: const Text("Finalizar Compra")
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
