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

  Future<List<ProductsDelhaize>> fetchSearchDelhaize(searchTerm) async {
    int page = 0;
    String placeId = "455";
    String size = "2";
    String urlDelhaize =
        'https://api.delhaize.be/?operationName=GetProductSearch&variables={"lang":"fr","searchQuery":"$searchTerm","pageNumber":${page.toString()},"pageSize":$size,"filterFlag":true,"useSpellingSuggestion":true}&extensions={"persistedQuery":{"version":1,"sha256Hash":"d35a68b909fdfc67c6911c7fa14700ddecb1b170e805715a2bf7419ab73b157e"}}';
    print(urlDelhaize);
    final responseCLP = await dio.get(urlDelhaize);

    if (responseCLP.statusCode == 200) {
      final result = responseCLP.data["data"]["productSearch"]["products"];
      Iterable list = result;
      return list.map((product) => ProductsDelhaize.fromJson(product)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }
}
