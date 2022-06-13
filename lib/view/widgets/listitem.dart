import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:selecteat_app/utils/constants.dart';

class ListItem extends StatefulWidget {
  final dynamic productList;

  const ListItem({
    Key? key, required this.productList,
  }) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  List<int> countList=[];
  int _count = 1;

  void decrementCounter() {
    setState(() {
      if (_count > 1) {
        _count -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var list = widget.productList;

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 2.0, color: brandLightGreyColor),
              bottom: BorderSide(width: 2.0, color: brandLightGreyColor),
            ),
            color: brandPrimaryOpaqueColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: "Items to pick at ",
                    style: TextStyle(
                      color: brandDarkColor,
                    ),
                  ),
                  TextSpan(
                    text: list,
                    style: const TextStyle(
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
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: brandLightGreyColor),
                  ),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: CachedNetworkImage(
                        width: 100,
                        fit: BoxFit.fitWidth,
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
                          SizedBox(
                            width: size.width / 2,
                            child: const Text(
                              "FiletlapjesFiletlapjesFiletlapjes",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: brandDarkColor,
                              ),
                            ),
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
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            onPressed: () {
                                              decrementCounter();
                                            },
                                          ),
                                          Text(_count.toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: brandDarkColor,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {
                                              setState(() {
                                                _count += 1;
                                              });
                                            },
                                          ),
                                        ])),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }
}
