import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/screens/list_screen.dart';
import 'package:selecteat_app/viewmodels/nearby_stores_list_view_model.dart';
import 'package:selecteat_app/viewmodels/nearbystores_view_model.dart';

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
  }

  void _addProductToList() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ListScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var nearbyStoreslistViewModel =
        Provider.of<NearbyStoresListViewModel>(context);
    List nearbyStoresList = nearbyStoreslistViewModel.nearbyStoresList;
    var nearbyStores = nearbyStoresList[1];

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
            SizedBox(
              height: size.height / 40,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 20),
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ]),
                      child: CachedNetworkImage(
                        width: 40,
                        imageUrl:
                            "https://loicmaupin.files.wordpress.com/2021/09/logo-carrefour.jpg",
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                        nearbyStores.properties["commercialName"].length > 28
                            ? nearbyStores.properties["commercialName"]
                                    .substring(0, 28) +
                                '...'
                            : nearbyStores.properties["commercialName"],
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
                            '(Price and time or estimated)',
                            style: TextStyle(
                              color: brandRedNotifyColor,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      )
                    ]),
                    const Text(
                      // '€ ' + product.baseprice.replaceAll('.', ','),
                      '€ 76,35',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: brandDarkColor,
                      ),
                    ),
                  ],
                )
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
