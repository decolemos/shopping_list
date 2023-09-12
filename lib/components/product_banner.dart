// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_list/models/product.dart';
import 'package:shopping_list/provider/product_provider.dart';

class ProductBanner extends StatefulWidget {

  final Product product;


  const ProductBanner({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductBanner> createState() => _ProductBannerState();
}

class _ProductBannerState extends State<ProductBanner> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Card(
      elevation: 6,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5)
            ),
            child: Stack(
              children: [
                Image.network(widget.product.img),
                IconButton(
                  onPressed: () {
                    provider.removeProductFirebase(widget.product.id);
                  }, 
                  icon: const Icon(
                    Icons.delete,
                  )
                )
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "R\$${widget.product.price.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    IconButton(
                      onPressed: () {
                        provider.addProductShoppingCar(
                          widget.product.id,
                          widget.product.name,
                          widget.product.price, 
                          widget.product.img
                        );
                      }, 
                      icon: const Icon(Icons.add_shopping_cart)
                    )
                  ],
                ),
              ],
            ),
          ) 
        ],
      ),
    );
  }
}
