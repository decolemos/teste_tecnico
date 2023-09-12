// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:teste_tecnico/model/produto.dart';

class ShoppCart extends ChangeNotifier {
  int idCart;
  Product product;
  ShoppCart({
    required this.idCart,
    required this.product,
  });
}
