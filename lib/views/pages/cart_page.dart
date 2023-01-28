import 'package:flutter/material.dart';
import 'package:ms/controller/read_product.dart';
import 'package:ms/views/widgets/cart_tile.dart';

import '../../model/cart.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: cartProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Cart> cartproducts = snapshot.data!;
          return ListView.builder(
            itemCount: cartproducts.length,
            itemBuilder: (context, index) {
              Cart product = cartproducts[index];
              return CartTile(
                pid: product.pid,
              );
            },
          );
        } else {
          return const Center(
            child: Text('Some error'),
          );
        }
      },
    );
  }
}
