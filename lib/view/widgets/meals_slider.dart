import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/viewmodels/meals_view_model.dart';

class MealsSlider extends StatelessWidget {
  final List<MealViewModel> gridList;

  const MealsSlider({Key? key, required this.gridList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: gridList.length,
        itemBuilder: (context, index) {
          var meal = gridList[index];
          return Container(
            width: size.width / 1.3,
            margin: const EdgeInsets.only(right: 20),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: brandPrimaryColor,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0x9026D16D),
                          Color(0x0026D16D),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.8],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.title,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          const TextButton(
                            onPressed: null,
                            child: Text("Start meal"),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
