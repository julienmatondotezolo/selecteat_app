import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/widgets/select_eat_stores.dart';

class SelectEatScreen extends StatelessWidget {
  final dynamic meal;
  const SelectEatScreen({Key? key, required this.meal}) : super(key: key);

  void _balanced(context, ingredients) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return SelectEatStores(ingredients: ingredients);
        });
  }

  void _ecologic(context, ingredients) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return SelectEatStores(ingredients: ingredients);
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add ingredients",
          ),
          toolbarHeight: 80,
          elevation: 0,
          foregroundColor: brandDarkColor,
          backgroundColor: brandLightGreyColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Select between the 2 options to add the ingredients for ${meal.title} with feta to your cart.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: brandDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextStyle(
                  style: const TextStyle(color: Colors.white),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: const BoxDecoration(
                        color: brandPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 10),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width / 1.5,
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Balanced',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'The healthiest ingredients based on the nutri-score to compose a balanced cart.',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'The ingredients will be from one or different stores near you.',
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => _balanced(context, meal.ingredients),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: brandPrimaryColor,
                            size: 20,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(38, 38),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: const BoxDecoration(
                      color: brandPrimaryOpaqueColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width / 1.5,
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Economic',
                                style: TextStyle(
                                  color: brandDarkColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'The cheapest ingredients from different stores.',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'The ingredients will be from one or different stores near you.',
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _ecologic(context, meal.ingredients),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: brandPrimaryColor,
                          padding: EdgeInsets.zero,
                          minimumSize: Size(38, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
