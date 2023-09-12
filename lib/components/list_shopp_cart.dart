// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/product.dart';
import 'package:shopping_list/provider/product_provider.dart';

class ListShoppCart extends StatefulWidget {

  final Product product;
  final int idCart;

  const ListShoppCart({
    Key? key,
    required this.product,
    required this.idCart,
  }) : super(key: key);

  @override
  State<ListShoppCart> createState() => _ListShoppCartState();
}

class _ListShoppCartState extends State<ListShoppCart> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Image.network(
          widget.product.img 
        ),
        title: Text(widget.product.name),
        subtitle: Text("R\$${widget.product.price}"),
        trailing: IconButton(
          onPressed: () {
            provider.removeProduct(
              widget.idCart,
              widget.product.price
            );
          }, 
          icon: const Icon(Icons.delete)
        ),
      ),
    );
  }
}