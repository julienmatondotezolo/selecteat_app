import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class IngredientCounter extends StatefulWidget {
  const IngredientCounter({Key? key, required this.mealDetail})
      : super(key: key);
  final dynamic mealDetail;

  @override
  State<StatefulWidget> createState() => _IngredientCounterState();
}

class _IngredientCounterState extends State<IngredientCounter> {
  int _count = 4;

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
    var meal = widget.mealDetail;
    List<dynamic> ingredientsList = meal.ingredientsList;
    // var persons = meal.persons;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: brandPrimaryColor,
                        width: 1.0,
                        style: BorderStyle.solid,
                      )),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            decrementCounter();
                          },
                        ),
                        Text(_count.toString() + " people"),
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
        SizedBox(
          height: size.height / 40,
        ),
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                (double.parse(ingredient['quantity']) * _count)
                                    .toString(),
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
      ],
    );
  }
}
