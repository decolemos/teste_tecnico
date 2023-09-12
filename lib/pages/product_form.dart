// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:teste_tecnico/providers/product_provider.dart';

class ProductForm extends StatefulWidget {

  const ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  final _fomKey = GlobalKey<FormState>();
  late String nameProduct;
  late double price;
  late String material;
  late String url;

  void _submit() {
    if(!_fomKey.currentState!.validate()) return;

    _fomKey.currentState!.save();

    Provider.of<ProductProvider>(context, listen: false).addProductList(
      nameProduct, 
      price, 
      material, 
      url
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Adicionar Produto", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _submit();
            }, 
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            )
          )
        ],
      ),
      body: Form(
        key: _fomKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nome do produto",
                  hintText: "Informe o nome do produto"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "O campo nome não pode ser vazio";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  nameProduct = newValue!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Preço do produto",
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
                  labelText: "Material",
                  hintText: "Informe o material do produto"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "O campo material não pode ser vazio";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  material = newValue!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Imagem do produto",
                  hintText: "Informe a url da imagem produto"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "O campo image não pode ser vazio";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  url = newValue!;
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}