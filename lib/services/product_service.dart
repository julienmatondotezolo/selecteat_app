import 'package:dio/dio.dart';
import 'package:selecteat_app/models/meals.dart';
import 'package:selecteat_app/models/products.dart';

class ProductService {
  var dio = Dio();

  Future<List<Products>> fetchProducts() async {
    String url = "https://3cli754824.execute-api.eu-west-3.amazonaws.com/dev/product";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['body'];
      return list.map((product) => Products.fromJson(product)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }

  Future<List<Meals>> fetchMeals() async {
    String url = "https://ecgrecipemw.colruyt.be/ecgrecipemw/fr/v1/recipes?application=Colruyt%20Culinair&page=1&size=20&";

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