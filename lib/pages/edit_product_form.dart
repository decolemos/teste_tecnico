// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:teste_tecnico/providers/product_provider.dart';

class EditProductForm extends StatefulWidget {

  final int id;

  const EditProductForm({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {

  final _fomKey = GlobalKey<FormState>();
  late String newName;
  late double newPrice;
  late String newMaterial;
  late String newUrl;

  void _submitEdit() {
    if(!_fomKey.currentState!.validate()) return;

    _fomKey.currentState!.save();

    Provider.of<ProductProvider>(context, listen: false).editProductList(
      widget.id,
      newName, 
      newPrice, 
      newMaterial, 
      newUrl
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Editar Produto", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _submitEdit();
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
                  labelText: "Editar Nome do produto",
                  hintText: "Informe o novo nome do produto"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "O campo nome não pode ser vazio";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  newName = newValue!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Novo preço do produto",
                  hintText: "Informe o novo preço do produto"
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
                  newPrice = double.parse(newValue!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Novo Material",
                  hintText: "Informe o novo material do produto"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "O campo material não pode ser vazio";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  newMaterial = newValue!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nova Imagem do produto",
                  hintText: "Informe a nova url da imagem produto"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "O campo image não pode ser vazio";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  newUrl = newValue!;
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}