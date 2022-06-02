import 'package:dio/dio.dart';
import 'package:selecteat_app/models/products.dart';

class NearbyService {
  var dio = Dio();
  var lat = "50.849050";
  var long = "4.307520";

  Future<List> fetchNearbyStores() async {
    String url =
        "https://3cli754824.execute-api.eu-west-3.amazonaws.com/dev/nearbystores/$lat/$long";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['groceryObj'];
      return list.map((product) => Products.fromJson(product)).toList();
    } else {
      throw Exception("Failled to get nearby stores");
    }
  }
}
