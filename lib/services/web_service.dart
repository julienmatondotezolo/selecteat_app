import 'package:dio/dio.dart';
import 'package:selecteat_app/models/products.dart';

class WebService {
  var dio = Dio();

  Future<List<Products>> fetchTopHeadlines() async {
    String url = "https://3cli754824.execute-api.eu-west-3.amazonaws.com/dev/product";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['body'];
      return list.map((result) => Products.fromJson(result)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }
}