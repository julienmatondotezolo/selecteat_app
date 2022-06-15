import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class ListItem extends StatefulWidget {
  final dynamic productList;

  const ListItem({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  List<int> countList = [];
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
    List<ProductViewModel> productList = widget.productList;

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
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
                            child: Text(product.name,
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
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            onPressed: () {
                                              decrementCounter();
                                            },
                                          ),
                                          Text(
                                            _count.toString(),
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
            });

  }
}