import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductViewModel> productsList;

  const ProductsGrid({
    Key? key,
    required this.productsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true, 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .7,
      ),
      itemCount: productsList.length,
      // itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        var product = productsList[index];

        return Stack(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CachedNetworkImage(
                      height: 120, 
                      imageUrl: product.image_url,
                  ),
                  const SizedBox(height: 5),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          product.store,
                          style: const TextStyle(fontSize: 10),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          // product.name,
                          // overflow: TextOverflow.ellipsis,
                          product.name.length > 15
                              ? product.name.substring(0, 15) + '...'
                              : product.name,
                          softWrap: false,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '€ ' + product.baseprice.replaceAll('.', ','),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: brandPrimaryColor,
                          ),
                        ),
                      ])
                ],
              ),
            ),
            Positioned(
              child: ElevatedButton(
                onPressed: null, 
                child: const Icon(
                  Icons.add_box_sharp,
                  color: brandPrimaryColor,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.yellow,
                  padding: const EdgeInsets.all(0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(5)),
                  ),
                ),
              ),
              top: 15,
              right: 0,
            ),
          ],
        );
      },
    );
  }
}
