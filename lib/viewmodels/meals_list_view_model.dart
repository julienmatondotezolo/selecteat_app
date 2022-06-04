import 'package:flutter/material.dart';
import 'package:selecteat_app/models/meals.dart';
import 'package:selecteat_app/services/product_service.dart';
import 'package:selecteat_app/viewmodels/meals_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class MealsListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<MealViewModel> mealsList = <MealViewModel>[];

  void allMeals() async {
    List<Meals> allMeals = await ProductService().fetchMeals();
    notifyListeners();

    mealsList = allMeals
        .map((meal) => MealViewModel(meal: meal))
        .toList();

    if (mealsList.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void similarMeals() async {
    //
  }
}
