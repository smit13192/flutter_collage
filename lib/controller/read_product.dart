import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ms/model/user.dart';

import '../model/cart.dart';
import '../model/product.dart';

Future<Product?> readProduct(String id) async {
  final doctproduct = FirebaseFirestore.instance.collection("products").doc(id);
  final snapshot = await doctproduct.get();
  if (snapshot.exists) {
    return Product.fromMap(snapshot.id, snapshot.data()!);
  }
  return null;
}

Stream<List<Product>> readProducts() => FirebaseFirestore.instance
    .collection("products")
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((product) => Product.fromMap(product.id, product.data()))
        .toList());

Future<List<Cart>> cartProduct() async {
  List<Cart> cartProduct = [];
  DatabaseReference ref =
      FirebaseDatabase.instance.ref('cart').child(AppUser.email.split('@')[0]);

  DatabaseEvent event = await ref.once();
  if (event.snapshot.value != null) {
    Map products = event.snapshot.value as Map;
    products.forEach((key, value) {
      cartProduct.add(Cart.fromMap(value['id'], value));
    });
  }
  return cartProduct;
}

Stream<List<Cart>> readCartProducts() {
  return FirebaseFirestore.instance
      .collection('Users')
      .doc(AppUser.email.split("@")[0])
      .collection('cart')
      .snapshots()
      .map((event) => event.docs
          .map((cart) => Cart.fromMap(cart.id, cart.data()))
          .toList());
}
