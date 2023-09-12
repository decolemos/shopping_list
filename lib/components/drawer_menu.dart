import 'package:flutter/material.dart';
import 'package:shopping_list/screens/add_product.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: Text(
              "Administrador",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            )
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AddProduct();
                },)
              );
            },
            leading: const Icon(Icons.add),
            title: const Text("Adicionar produto"),
          ),
          const ListTile(
            leading: Icon(Icons.edit),
            title: Text("Editar produto"),
          ),
          const ListTile(
            leading: Icon(Icons.delete),
            title: Text("Remover produto"),
          ),
        ],
      ),
    );
  }
}