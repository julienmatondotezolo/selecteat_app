import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/screens/home_screen.dart';
import 'package:selecteat_app/view/screens/nearby_stores_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  void _continue_shopping(context) {
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
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 2.0, color: brandLightGreyColor),
                        bottom: BorderSide(width: 2.0, color: brandLightGreyColor),
                      ),
                      color: brandPrimaryOpaqueColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: "Items to pick at ",
                              style: TextStyle(
                                color: brandDarkColor,
                              ),
                            ),
                            TextSpan(
                              text: "Colruyt",
                              style: TextStyle(
                                color: brandDarkColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                        ),
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: "Total: ",
                              style: TextStyle(
                                color: brandDarkColor,
                              ),
                            ),
                            TextSpan(
                              text: "€ 4,45",
                              style: TextStyle(
                                color: brandDarkColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 10),
                              ]),
                          child: CachedNetworkImage(
                            height: 120,
                            fit: BoxFit.contain,
                            imageUrl:
                                "https://cdn.carrefour.eu/300_05010759_5400101017634_00.jpeg",
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Carrefour"),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: brandDarkColor,
                                    size: 12,
                                  ),
                                ],
                              ),
                              Text(
                                "FiletlapjesFiletlapjesFiletlapjes",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Image(
                                      width: 40,
                                      image: Svg(
                                        "https://static.openfoodfacts.org/images/attributes/nutriscore-a.svg",
                                        source: SvgSource.network,
                                      ),
                                  ),
                                  Text(
                                    '€ 6,00',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: brandPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
