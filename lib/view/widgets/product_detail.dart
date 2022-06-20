import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/auth/provider/user_provider.dart';
import 'package:selecteat_app/controllers/favourites.dart';
import 'package:selecteat_app/controllers/list.dart';
import 'package:selecteat_app/utils/constants.dart';

class ProductDetail extends StatefulWidget {
  final dynamic productList;

  const ProductDetail({Key? key, required this.productList}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _exists = false;
  bool _existsFavs = false;
  var user;

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
      // user = Provider.of<UserProvider>(context).currentUser;
      // list = Provider.of<ListController>(context);

    //   list!.checkProductList(user!.uid, widget.productList);
    //   print("Product exist is ${list!.exists}");
    //   setState(() {
    //     _exists = list!.exists;
    //   });
    //   print("State: ${list!.exists}");
    // });
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    user = Provider.of<UserProvider>(context).currentUser;
    ListController list = Provider.of<ListController>(context);
    FavouritesController favourites =
        Provider.of<FavouritesController>(context);
    List productsList = Provider.of<ListController>(context).productsList;

    void _addProductToList(productList, context) async {
      list.addProductList(user.uid, productList);
    }

    void _removeFromList(productList, context) async {
      list.removeProductFromList(user.uid, productList);
    }

    void _checkProductList(productList, context) async {
      list.checkProductList(user.uid, productList);
      print("Product exist is ${list.exists}");
      setState(() {
        _exists = list.exists;
      });
      print("State: ${list.exists}");
    }

    void _addProductToFavs(productList, context) async {
      favourites.addFavouritesList(user!.uid, productList);
    }

    void _removeFromFavs(productList, context) async {
      favourites.removeFavouritesFromList(user!.uid, productList);
    }

    void _checkProductFavs(productList, context) async {
      favourites.checkFavouritesList(user!.uid, productList);
      print("Product exist is ${favourites.exists}");
      setState(() {
        _existsFavs = favourites.exists;
      });
      print("State: ${favourites.exists}");
    }

    _checkProductList(widget.productList, context);
    _checkProductFavs(widget.productList, context);

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
            SizedBox(
              height: size.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width / 2.5,
                  height: size.height / 5,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10)
                      ]),
                  child: Center(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: brandPrimaryColor,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: size.width / 3,
                      imageUrl: widget.productList.imageurl,
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
                        widget.productList.store,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(widget.productList.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(
                        widget.productList.baseprice,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: brandPrimaryColor,
                        ),
                      ),
                      widget.productList.nutriscoreletter != null
                          ? Image(
                              width: size.width / 5,
                              image: Svg(
                                "https://static.openfoodfacts.org/images/attributes/nutriscore-" +
                                    widget.productList.nutriscoreletter
                                        .toLowerCase() +
                                    ".svg",
                                source: SvgSource.network,
                              ))
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width / 1.4,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: _exists == false
                            ? TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: brandPrimaryColor,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15)),
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
                                    backgroundColor: brandRedNotifyColor,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15)),
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
                _existsFavs == false
                    ? TextButton(
                        onPressed: () =>
                            _addProductToFavs(widget.productList, context),
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
                      )
                    : TextButton(
                        onPressed: () =>
                            _removeFromFavs(widget.productList, context),
                        child: const Icon(
                          Icons.favorite,
                          color: brandRedNotifyColor,
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
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
