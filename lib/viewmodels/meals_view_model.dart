import 'package:selecteat_app/models/meals.dart';

class MealViewModel {
  final Meals _meals;

  MealViewModel({required Meals meal}) : _meals = meal;

  String get id {
    return _meals.id;
  }

  String get image {
    return _meals.image;
  }

  String? get timing {
    return _meals.timing;
  }

  String get title {
    return _meals.title;
  }
}