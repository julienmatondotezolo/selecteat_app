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
            child: Text(product.name),
          ),
          // Image.network(listViewModel.productsList[index].image_url),
        );
      },
    );
  }
}
