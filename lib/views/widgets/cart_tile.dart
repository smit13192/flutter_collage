import 'package:flutter/material.dart';
import 'package:ms/controller/read_product.dart';

import '../../model/product.dart';

class CartTile extends StatelessWidget {
  final String pid;
  const CartTile({required this.pid, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product?>(
      future: readProduct(pid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Product product = snapshot.data!;
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 99,
                  height: 150,
                  child: Image.network(product.image[0]),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
