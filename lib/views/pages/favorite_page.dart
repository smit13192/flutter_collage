import 'package:flutter/material.dart';
import 'package:ms/views/widgets/favorite_tile.dart';

import '../../controller/read_product.dart';
import '../../model/constant.dart';
import '../../model/favorite_product.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
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
      body: StreamBuilder<List<FavouriteProduct>>(
        stream: readFavoriteProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return true;
                },
                child: GridView.builder(
                  addRepaintBoundaries: false,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    FavouriteProduct favoriteProduct = snapshot.data![index];
                    return FavoriteTile(favoriteProduct: favoriteProduct);
                  },
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.60,
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Your Favourite List Is Empty",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
