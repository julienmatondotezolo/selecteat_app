import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:selecteat_app/viewmodels/products_view_model.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductViewModel> productsList;

  const ProductsGrid({required this.productsList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: productsList.length,
      itemBuilder: (BuildContext context, int index) {
        var product = productsList[index];

        return GridTile(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              color: Colors.black,
              boxShadow: const [
                BoxShadow(color: Colors.black87, blurRadius: 6),
              ]
            ),
            child: Text(product.name)
            
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     CachedNetworkImage(imageUrl: product.image_url),
            //     Text(product.name)
            //   ],
            // ),
          ),
        );
      },
    );
  }
}
