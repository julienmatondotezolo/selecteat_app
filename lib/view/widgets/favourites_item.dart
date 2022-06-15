import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/auth/provider/user_provider.dart';
import 'package:selecteat_app/controllers/list.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class FavouritesItem extends StatefulWidget {
  final dynamic productList;
  final dynamic user;

  const FavouritesItem({
    Key? key,
    required this.productList,
    required this.user,
  }) : super(key: key);

  @override
  State<FavouritesItem> createState() => _FavouritesItemState();
}

class _FavouritesItemState extends State<FavouritesItem> {
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   _exists = Provider.of<ListController>(context).exists;
    // });
  }

  bool? _exists;

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user = widget.user;

    ListController list = Provider.of<ListController>(context);
    List<ProductViewModel> productList = widget.productList;

    void _addProductToList(productList, context) async {
      list.addProductList(user!.uid, productList);
    }

    void _removeFromList(productList, context) async {
      list.removeProductFromList(user!.uid, productList);
    }

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          var product = productList[index];
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: brandLightGreyColor),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: CachedNetworkImage(
                    width: 100,
                    fit: BoxFit.fitWidth,
                    imageUrl: product.imageurl,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.store),
                          Icon(
                            Icons.favorite_border_outlined,
                            color: brandDarkColor,
                            size: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width / 2,
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: brandDarkColor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            width: 40,
                            image: Svg(
                              "https://static.openfoodfacts.org/images/attributes/nutriscore-a.svg",
                              source: SvgSource.network,
                            ),
                          ),
                          Text(
                            product.baseprice,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: brandPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: brandPrimaryColor,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: _exists == false
                                        ? TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor:
                                                    brandPrimaryColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 40,
                                                        vertical: 15)),
                                            onPressed: () => _addProductToList(
                                                widget.productList, context),
                                            child: const Text(
                                              'Add to list +',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        : TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor:
                                                    brandRedNotifyColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 40,
                                                        vertical: 15)),
                                            onPressed: () => _removeFromList(
                                                widget.productList, context),
                                            child: const Text(
                                              'Remove from list +',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
