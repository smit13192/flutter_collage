import 'package:flutter/material.dart';
import 'package:ms/controller/read_product.dart';
import 'package:ms/views/widgets/cart_tile.dart';

import '../../model/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Cart>>(
      stream: readCartProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Cart> cartproducts = snapshot.data!;
          return ListView.builder(
            itemCount: cartproducts.length,
            itemBuilder: (context, index) {
              Cart product = cartproducts[index];
              return CartTile(
                cartproduct: product,
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
