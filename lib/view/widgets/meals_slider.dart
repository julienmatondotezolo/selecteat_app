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
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: gridList.length,
        itemBuilder: (context, index) {
          var meal = gridList[index];
          return Container(
            width: size.width / 1.3,
            margin: const EdgeInsets.only(top: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
              image: DecorationImage(
                  image: NetworkImage(meal.image), fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0x2626D16D),
                        Color(0xB3000000),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
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
                          const ElevatedButton(
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
