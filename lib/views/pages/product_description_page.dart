import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ms/model/product.dart';

import '../../model/constant.dart';

class ProductDescription extends StatelessWidget {
  final String id;
  final PageController pageController = PageController();
  ProductDescription({required this.id, super.key});

  Future<Product?> readProduct() async {
    final doctproduct =
        FirebaseFirestore.instance.collection("products").doc(id);
    final snapshot = await doctproduct.get();
    if (snapshot.exists) {
      return Product.fromMap(snapshot.id, snapshot.data()!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          appName,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w200,
            letterSpacing: 2,
          ),
        ),
      ),
      body: FutureBuilder<Product?>(
        future: readProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 450,
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: snapshot.data!.image.length,
                              itemBuilder: (context, index) {
                                return Image.network(snapshot.data!.image[index]);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              snapshot.data!.company,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Text(
                            snapshot.data!.title,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black45,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Rs. ${snapshot.data!.price.toString()}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Fit: ${snapshot.data!.fit}",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              snapshot.data!.description,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "Composition: ${snapshot.data!.composition}",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: const Center(
                                  child: Text(
                                "Add To Cart",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: const Center(child: Text("Buy Now")),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Some error"),
            );
          }
        },
      ),
    );
  }
}
