import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class ProductDetail extends StatelessWidget {
  final dynamic productList;

  const ProductDetail({Key? key, required this.productList}) : super(key: key);

  void _addProductToList() async {
    return null;
  }

  void _addProductToFavs() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ]),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height / 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width / 2.5,
                  height: size.height / 5,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10)
                      ]),
                  child: Center(
                    child: CachedNetworkImage(
                      width: size.width / 3,
                      imageUrl: productList.image_url,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList.store,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(productList.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(
                        '€ ' + productList.baseprice.replaceAll('.', ','),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: brandPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width / 1.4,
                  child: Expanded(
                    child: TextButton(
                              style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: brandPrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15)
                              ),
                    onPressed: _addProductToList,
                    child: const Text(
                      'Add to list +',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ),
                TextButton(
                  onPressed: _addProductToFavs,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.grey,
                    size: 24,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: brandLightGreyColor,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(46, 46),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
