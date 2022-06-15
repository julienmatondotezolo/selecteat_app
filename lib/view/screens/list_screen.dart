import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/auth/provider/user_provider.dart';
import 'package:selecteat_app/controllers/list.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/widgets/list_store_price_total.dart';
import 'package:selecteat_app/view/widgets/listitem.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  void _continueShopping(context) {
    Navigator.pushNamed(context, '/home');
  }

  void _pickup(context) {
    Navigator.pushNamed(context, '/nearbyStores');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var user = Provider.of<UserProvider>(context).currentUser;

    ListController productListController = Provider.of<ListController>(context);
    productListController.getProductList(user!.uid);
    List<ProductViewModel> productsList =
        Provider.of<ListController>(context).productsList;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Shopping list",
          ),
          toolbarHeight: 80,
          elevation: 0,
          foregroundColor: brandDarkColor,
          backgroundColor: brandLightGreyColor,
        ),
        body: Stack(children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListStorePriceTotal(store: "carrefour"),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      var productItem = productsList[index];
                      List<ProductViewModel> carrefourList = [];

                      if (productItem.store == "carrefour") {
                        carrefourList.add(productsList[index]);
                        return Column(
                          children: [
                            ListItem(
                                productList: carrefourList),
                          ],
                        );
                      }

                      return SizedBox.shrink();
                    },
                  ),
                  ListStorePriceTotal(store: "Colruyt"),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      var productItem = productsList[index];
                      List<ProductViewModel> colruytList = [];

                      if (productItem.store == "colruyt") {
                        colruytList.add(productsList[index]);
                        return Column(
                          children: [
                            ListItem(
                                productList: colruytList),
                          ],
                        );
                      }

                      return SizedBox.shrink();
                    },
                  ),
                  ListStorePriceTotal(store: "Delhaize"),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      var productItem = productsList[index];
                      List<ProductViewModel> delhaizeList = [];

                      if (productItem.store == "delhaize") {
                        delhaizeList.add(productsList[index]);
                        return Column(
                          children: [
                            ListItem(productList: delhaizeList),
                          ],
                        );
                      }

                      return SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: size.height / 3.5),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                              "This is an approximate price that will help you estimate the price of your purchases.",
                              // softWrap: false,
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 4,
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Total:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: brandDarkColor,
                          ),
                        ),
                        Text(
                          "€ 76,35",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: brandPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            side: const BorderSide(
                                width: 2.0, color: brandDarkColor),
                            // backgroundColor: brandPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                          onPressed: () => _continueShopping(context),
                          child: const Text(
                            'Continue shopping',
                            style: TextStyle(
                              color: brandDarkColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: brandPrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15)),
                          onPressed: () => _pickup(context),
                          child: const Text(
                            'Pick up products',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            bottom: 0,
          )
        ]));
  }
}
