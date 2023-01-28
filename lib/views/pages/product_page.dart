import 'package:flutter/material.dart';
import 'package:ms/views/widgets/product_tile.dart';
import '../../controller/read_product.dart';
import '../../model/constant.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: readProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: GridView.builder(
                addRepaintBoundaries: false,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, productDescription,
                            arguments: snapshot.data![index].id);
                      },
                      child: ProductTile(product: snapshot.data![index]));
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.6,
                )),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(child: Text("error"));
        }
      },
    );
  }
}
