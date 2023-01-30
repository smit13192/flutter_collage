import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms/controller/read_product.dart';

import '../../model/cart.dart';
import '../../model/product.dart';

class CartTile extends StatelessWidget {
  final Cart cartproduct;
  const CartTile({required this.cartproduct, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product?>(
      future: readProduct(cartproduct.pid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Product product = snapshot.data!;
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 99,
                    height: 150,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(product.image[0])),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Spacer(),
                        Text(
                          product.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          product.company,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          product.fit ?? "",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Rs. ${product.price.toString()}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Spacer(),
                        OutlinedButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection('Users')
                                .doc(FirebaseAuth.instance.currentUser!.email!
                                    .split("@")[0])
                                .collection('cart')
                                .doc(cartproduct.id).delete();
                          },
                          child: const Text(
                            "Remove",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
