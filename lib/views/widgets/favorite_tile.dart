import 'package:flutter/material.dart';
import 'package:ms/model/favorite_product.dart';
import 'package:ms/model/product.dart';

import '../../controller/read_product.dart';
import 'favorite_page_icon.dart';

class FavoriteTile extends StatelessWidget {
  final FavouriteProduct favoriteProduct;
  const FavoriteTile({required this.favoriteProduct, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product?>(
      future: readProduct(favoriteProduct.fid),
      builder: (context, snapshot) {
        Product? product = snapshot.data;
        if (product != null) {
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
                      FavoritePageIcon(favoriteProduct: favoriteProduct)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product.company,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Rs. ${product.price.toString()}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
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
