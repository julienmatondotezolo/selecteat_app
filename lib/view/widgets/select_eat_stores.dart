import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/screens/list_screen.dart';
import 'package:selecteat_app/viewmodels/nearby_stores_list_view_model.dart';

class SelectEatStores extends StatefulWidget {
  const SelectEatStores({Key? key, required this.ingredients})
      : super(key: key);

  final dynamic ingredients;

  @override
  State<SelectEatStores> createState() => _SelectEatStoresState();
}

class _SelectEatStoresState extends State<SelectEatStores> {
  @override
  void initState() {
    super.initState();
    Provider.of<NearbyStoresListViewModel>(context, listen: false)
        .allNearbyStores();

    Timer(const Duration(seconds: 1), () {
      setState(() {
        shouldShow = false;
      });
    });
  }

  bool shouldShow = true;

  void _addProductToList() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ListScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    print(shouldShow);
    var nearbyStoreslistViewModel =
        Provider.of<NearbyStoresListViewModel>(context);
    List nearbyStoresList = nearbyStoreslistViewModel.nearbyStoresList;

    var size = MediaQuery.of(context).size;

    if (nearbyStoresList.isEmpty) {
      return Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: const [
              CircularProgressIndicator(color: brandPrimaryColor),
              SizedBox(
                height: 40,
              ),
              Text(
                "Selecting all nearby stores..",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
    }

    if (shouldShow) {
      return Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: const [
              CircularProgressIndicator(color: brandPrimaryColor),
              SizedBox(
                height: 40,
              ),
              Text(
                "Selecting all balanced ingredients...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
    }

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
            Column(
              children: [
                ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    // itemCount: nearbyStoresList.length,
                    itemBuilder: (context, index) {
                      var nearbyStores = nearbyStoresList[index];

                      return Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 10),
                                  ]),
                              child: CachedNetworkImage(
                                width: 50,
                                fit: BoxFit.cover,
                                imageUrl:
                                    "https://loicmaupin.files.wordpress.com/2021/09/logo-carrefour.jpg",
                              ),
                            ),
                            Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nearbyStores.properties["commercialName"],
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${nearbyStores.distance} - ',
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Text(
                                          '(This an estimated price)',
                                          style: TextStyle(
                                            color: brandRedNotifyColor,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.info_outline,
                                          color: brandDarkColor,
                                          size: 12,
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              // '€ ' + product.baseprice.replaceAll('.', ','),
                              '€ 176,35',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: brandDarkColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: brandPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15)),
                    onPressed: _addProductToList,
                    child: const Text(
                      'Select balanced ingredients in multiple stores',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
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
