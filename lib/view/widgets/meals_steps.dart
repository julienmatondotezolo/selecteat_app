import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class MealSteps extends StatelessWidget {
  final dynamic mealDetail;

  const MealSteps({Key? key, required this.mealDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var meal = mealDetail;
    var steps = mealDetail.steps;

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: const BoxDecoration(
                      color: brandPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.timelapse,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: size.width / 80),
                        Text(meal.preparationtime,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  )
                ])
              ],
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Steps",
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
                  itemCount: steps.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var ingredient = steps[index];
                    var stepsCount = (index + 1).toString();
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
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: brandPrimaryColor,
                                            shape: BoxShape.circle),
                                        child: Text(
                                          stepsCount,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Text(
                                        ingredient,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}
