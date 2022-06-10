import 'package:dio/dio.dart';
import 'package:selecteat_app/models/meals.dart';
import 'package:selecteat_app/models/products.dart';
import 'package:selecteat_app/models/productsColruyt.dart';

class ProductService {
  var dio = Dio();

  Future<List<Products>> fetchProducts() async {
    String url =
        "https://3cli754824.execute-api.eu-west-3.amazonaws.com/dev/product?size=20&clpPlaceId=727";
    String url2 =
        "https://ecgproductmw.colruyt.be/ecgproductmw/v2/fr/products/?clientCode=CLP&placeId=727&page=1&isAvailable=true";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      // Iterable list = result['products'];
      return list.map((product) => Products.fromJson(product)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }

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
