// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/provider/product_provider.dart';

class AddProduct extends StatefulWidget {

  const AddProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  final _formKey = GlobalKey<FormState>();
  late String name;
  late double price;
  late String img;

  void _submit() {
    if(!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    Provider.of<ProductProvider>(context, listen: false).addProductFirebase(name, price, img);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar produto"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nome",
                  hintText: "Informe o nome do produto"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "O campo nome não pode ser vazio";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  name = newValue!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Preço",
                  hintText: "Informe o preço do produto"
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d+\.?\d{0,2}$'),
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  final numericValue = double.tryParse(value);
                  if (numericValue == null) {
                    return 'Por favor, insira um número válido';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  price = double.parse(newValue!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Imagem",
                  hintText: "Informe a url da image"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "O campo imagem não pode ser vazio";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  img = newValue!;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _submit();
                  }, 
                  child: const Text("Confirmar")
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: const Text("Cancelar")
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}