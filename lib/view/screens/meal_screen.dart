import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class MealScreen extends StatelessWidget {
  final dynamic meal;

  const MealScreen({Key? key, required this.meal}) : super(key: key);

  void _addProductToList() async {
    return null;
  }

  void _addProductToFavs() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
          ),
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              color: brandPrimaryLightColor,
              image: DecorationImage(
                image: NetworkImage(meal.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: size.height * .2,
            left:0.0,
            right:0.0,
            bottom:0.0,
            child: SafeArea(
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
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              meal.title,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: brandDarkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Column(children: [
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ),
                          ])
                        ],
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Column(
                        children: [Text(meal.description)],
                      ),
                      SizedBox(
                        height: size.height / 20,
                      ),
                      Column(
                        children: [
                          const Text(
                            "Ingrédients",
                            style: TextStyle(
                              color: brandDarkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 40,
                          ),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 20,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: const BoxDecoration(
                                  border: Border.symmetric(
                                    horizontal: BorderSide(
                                     color: brandLightGreyColor,
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    )
                                  )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              "Ingrédients",
                                              style: TextStyle(
                                                color: brandDarkColor,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Ingrédients",
                                            style: TextStyle(
                                              color: brandDarkColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: brandDarkColor,
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
          )
        ],
      ),
    );
  }
}
