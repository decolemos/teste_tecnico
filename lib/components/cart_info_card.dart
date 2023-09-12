import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico/providers/product_provider.dart';

class CartInfoCard extends StatelessWidget {

  final void Function() onButtonTapped;

  const CartInfoCard({
    super.key, 
    required this.onButtonTapped, 
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 100,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text("TOTAL: R\$${provider.valueTotal.toStringAsFixed(2)}"),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black
              ),
              onPressed: () {
                onButtonTapped();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Compra realizada!"))
                );
                Navigator.of(context).pop();
              }, 
              child: const Text("COMPRAR", style: TextStyle(color: Colors.white))
            ),
          )
        ],
      ),
    );
  }
}