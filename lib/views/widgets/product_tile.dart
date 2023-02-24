import 'package:flutter/material.dart';
import 'package:ms/model/product.dart';

import 'favorite_icon.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.image[0],
                  ),
                ),
                FavoriteIcon(id: product.id!,)
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            product.company,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            product.title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "Rs. ${product.price.toString()}",
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
