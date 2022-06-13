import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/screens/home_screen.dart';
import 'package:selecteat_app/view/screens/nearby_stores_screen.dart';
import 'package:selecteat_app/view/widgets/listitem.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  void _continueShopping(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }

  void _pickup(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NearbyStoreScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                  const ListItem(
                    productList: "Carrefour",
                  ),
                  const ListItem(
                    productList: "Colruyt",
                  ),
                  const ListItem(
                    productList: "Delhaize",
                  ),
                  // SizedBox(height: 250),
                  SizedBox(height: size.height / 3.5),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                    SizedBox(height: size.height / 40,),
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
                    SizedBox(height: size.height / 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              side: const BorderSide(width: 2.0, color: brandDarkColor),
                              // backgroundColor: brandPrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15
                              ),
                            ),
                          onPressed: () => _continueShopping,
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
                          onPressed: () => _pickup,
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
