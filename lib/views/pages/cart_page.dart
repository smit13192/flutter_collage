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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartproducts.length,
                    itemBuilder: (context, index) {
                      Cart product = cartproducts[index];
                      return CartTile(
                        cartproduct: product,
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          child: const Center(
                            child: Text(
                              "Place Order",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          child: const Center(
                            child: Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return const Center(
            child: Text('Some error'),
          );
        }
      },
    );
  }
}
