import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ms/model/constant.dart';
import 'package:ms/model/favorite_product.dart';

import '../model/cart.dart';
import '../model/product.dart';

// this is the firebase firestore database
Future<Product?> readProduct(String id) async {
  final doctproduct = FirebaseFirestore.instance.collection(productCollectionName).doc(id);
  final snapshot = await doctproduct.get();
  if (snapshot.exists) {
    return Product.fromMap(snapshot.id, snapshot.data()!);
  }
  return null;
}

// read all product in the firebase firestore database
Stream<List<Product>> readProducts() => FirebaseFirestore.instance
    .collection(productCollectionName)
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((product) => Product.fromMap(product.id, product.data()))
        .toList());

// read car product in the firebase realtime database
Future<List<Cart>> cartProduct() async {
  List<Cart> cartProduct = [];
  DatabaseReference ref = FirebaseDatabase.instance
      .ref(usersCartCollectionName)
      .child(FirebaseAuth.instance.currentUser!.email!.split("@")[0]);

  DatabaseEvent event = await ref.once();
  if (event.snapshot.value != null) {
    Map products = event.snapshot.value as Map;
    products.forEach((key, value) {
      cartProduct.add(Cart.fromMap(value['id'], value));
    });
  }
  return cartProduct;
}

// read cart product in the firebase firestore database
Stream<List<Cart>> readCartProducts() => FirebaseFirestore.instance
    .collection(usersCollectionName)
    .doc(FirebaseAuth.instance.currentUser!.email!.split("@")[0])
    .collection(usersCartCollectionName)
    .snapshots()
    .map(
      (event) =>
          event.docs.map((cart) => Cart.fromMap(cart.id, cart.data())).toList(),
    );

// read favorite product in the firebase firestore database
Stream<List<FavouriteProduct>> readFavoriteProduct() =>
    FirebaseFirestore.instance
        .collection(usersCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email!.split("@")[0])
        .collection(usersFavouriteCollectionName)
        .snapshots()
        .map(
          (event) => event.docs
              .map((favouriteProduct) => FavouriteProduct.fromJson(
                  favouriteProduct.id, favouriteProduct.data()))
              .toList(),
        );
