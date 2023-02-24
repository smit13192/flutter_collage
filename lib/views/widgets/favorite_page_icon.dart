import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ms/model/constant.dart';

import '../../model/favorite_product.dart';

class FavoritePageIcon extends StatelessWidget {
  final FavouriteProduct favoriteProduct;
  const FavoritePageIcon({required this.favoriteProduct, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        enableFeedback: true,
        splashColor: Colors.transparent,
        iconSize: 20,
        onPressed: onPressed,
        icon: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
    );
  }

  onPressed() async {
    await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email!.split("@")[0])
        .collection(usersFavouriteCollectionName)
        .doc(favoriteProduct.pid)
        .delete();
    Fluttertoast.showToast(msg: "Remove Favorite");
  }
}
