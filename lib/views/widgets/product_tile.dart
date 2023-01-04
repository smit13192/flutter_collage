import 'package:flutter/material.dart';
import 'package:ms/model/product.dart';

class ProductTile extends StatelessWidget {
  final Product? product;
  const ProductTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                product!.image[0],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            product!.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Rs. ${product!.price.toString()}",
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
