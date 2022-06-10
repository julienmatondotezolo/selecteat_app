import 'package:selecteat_app/models/meals.dart';

class MealViewModel {
  final Meals _meals;

  MealViewModel({required Meals meal}) : _meals = meal;

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

  String get persons {
    return _meals.persons;
  }

  String get ingredients {
    return _meals.ingredients;
  }

  String get steps {
    return _meals.steps;
  }
}
