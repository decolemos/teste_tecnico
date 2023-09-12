import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste_tecnico/model/produto.dart';
import 'package:teste_tecnico/model/shopp_car.dart';

class ProductProvider extends ChangeNotifier {

  double valueTotal = 0.0;

  List<Product> products = [
    Product(
      id: 123, 
      nome: "Camisa Algodão 100% Cinza", 
      preco: 123, 
      material: "Algodão",
      url: "https://malwee.vtexassets.com/arquivos/ids/642858-1200-auto?v=638234727268470000&width=1200&height=auto&aspect=true"
    )
  ];

  List<ShoppCart> cart = [];


  void addProductList( String nameProduct, double price, String material, String url) {
    products.add(Product(
      id: Random().nextInt(9999),
      nome: nameProduct, 
      preco: price, 
      material: material, 
      url: url
    ));

    notifyListeners();
  }

    void addProductShoppingCar(int id, String name, double price, String material, String img) {
    cart.add(ShoppCart(
      idCart: Random().nextInt(9999), 
        product: (Product(
          id: id, 
          nome: name,
          preco: price,
          material: material,
          url: img
        )
      )
    ));

    print("produto adicionado");
    
    valueTotal += price;

    notifyListeners();

  }

  void editProductList(int id, String newName, double newPrice, String newMaterial, String newUrl) {
    products.add(Product(
      id: id, 
      nome: newName, 
      preco: newPrice, 
      material: newMaterial, 
      url: newUrl
    ));

    notifyListeners();
  }

  void removeProductListCart(int idCart, double price) {
      cart.removeWhere((product) => product.idCart == idCart);

      valueTotal -= price;

    notifyListeners();
  }

  void removeProductList(int id) {
    products.removeWhere((product) => product.id == id);

    notifyListeners();
  }

}