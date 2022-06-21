import 'package:dio/dio.dart';
import 'package:selecteat_app/models/meals.dart';
import 'package:selecteat_app/models/products_delhaize.dart';

class MealService {
  var dio = Dio();

  Future<List<Meals>> fetchMeals() async {
    String url =
        "https://3cli754824.execute-api.eu-west-3.amazonaws.com/dev/meals";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['body'];
      return list.map((meal) => Meals.fromJson(meal)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }
}
