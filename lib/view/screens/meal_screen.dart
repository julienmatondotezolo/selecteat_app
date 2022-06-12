import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/widgets/counter.dart';
import 'package:selecteat_app/view/widgets/meals_steps.dart';

class MealScreen extends StatelessWidget {
  final dynamic meal;

  const MealScreen({Key? key, required this.meal}) : super(key: key);

  void _addProductToList() async {
    return null;
  }

  void _startCooking(context, mealDetail) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return MealSteps(mealDetail: mealDetail);
        });
  }

  void _addProductToFavs() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<dynamic> ingredientsList = meal.ingredientsList;

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
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ingrédients",
                            style: TextStyle(
                              color: brandDarkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: size.height / 40,),
                          Counter(person: meal.persons),
                          SizedBox(height: size.height / 40,),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: ingredientsList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var ingredient = ingredientsList[index];
                              // print(ingredient);
                              return Container(
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                  color: brandLightGreyColor,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              ingredient['name'],
                                              // ingredients.name,
                                              style: const TextStyle(
                                                color: brandDarkColor,
                                              ),
                                            ),
                                          ),
                                          ingredient['quantity'] != null
                                              ? Text(
                                                  ingredient['quantity'],
                                                  style: const TextStyle(
                                                    color: brandDarkColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : const Text(""),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 150,
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
          ),
          Positioned(
            bottom: 60,
            child: SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: brandRedNotifyColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15)),
                      onPressed: _addProductToList,
                      child: const Text(
                        'Add to ingredients list +',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 60),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: brandPrimaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15)),
                      onPressed: () => _startCooking(context, meal),
                      child: const Text(
                        'Start cooking',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
