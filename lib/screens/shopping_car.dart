// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/provider/product_provider.dart';

class ShoppingCar extends StatelessWidget {

  const ShoppingCar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho de compras"),
        centerTitle: true,
      ),
      body: provider.listShoppingCar.isEmpty
      ? const Center(
        child: Text("Lista Vazia"),
      )
      : ListView.builder(
        itemCount: provider.listShoppingCar.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            child: ListTile(
              leading: Image.asset(
                "${provider.listShoppingCar[index].product.img}" 
              ),
              title: Text(provider.listShoppingCar[index].product.name),
              subtitle: Text("R\$${provider.listShoppingCar[index].product.price}"),
              trailing: IconButton(
                onPressed: () {
                  provider.removeProduct(
                    provider.listShoppingCar[index].idCart
                  );
                }, 
                icon: const Icon(Icons.delete)
              ),
            ),
          );
        },
      ),
    );
  }
}
