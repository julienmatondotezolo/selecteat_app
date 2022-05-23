import 'package:cache_image/cache_image.dart';
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
          child: Image(fit: BoxFit.cover, image: CacheImage(product.image_url)),
          // Image.network(listViewModel.productsList[index].image_url),
        );
      },
    );
  }
}
