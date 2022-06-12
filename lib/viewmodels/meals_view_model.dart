import 'package:selecteat_app/models/meals.dart';
import 'dart:convert';

class MealViewModel {
  final Meals _meals;

  MealViewModel({required Meals meal}) : _meals = meal;

  int get id {
    return _meals.id;
  }

  String get title {
    return _meals.title;
  }

  String get image {
    return _meals.image;
  }

  String get description {
    return _meals.description;
  }

  String get cookingtime {
    return _meals.cookingtime;
  }

  String get preparationtime {
    var time = _meals.preparationtime.replaceAll(".0", " min");
    return time;
  }

  String get difficulty {
    return _meals.difficulty;
  }

  String get budget {
    return _meals.budget;
  }

  int get persons {
    var persons = int.parse(_meals.persons);
    return persons;
  }

  String get ingredients {
    return _meals.ingredients;
  }

  List<dynamic> get ingredientsList {
    String ingredientString = ingredients;
    List ingredientList = json.decode(ingredientString);
    return ingredientList;
  }

  List get steps {
    return json.decode(_meals.steps);
  }
}
