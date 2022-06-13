import 'dart:math';

import 'package:dio/dio.dart';
import 'package:selecteat_app/models/products.dart';
import 'package:selecteat_app/models/products_colruyt.dart';

class ProductService {
  var dio = Dio();

  Future<List<Products>> fetchProducts() async {
    String url =
        "https://3cli754824.execute-api.eu-west-3.amazonaws.com/dev/product?clpPlaceId=727";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((product) => Products.fromJson(product)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }

  Future<List<ProductsColruyt>> fetchProductsCLP() async {
    String urlCLP =
        "https://ecgproductmw.colruyt.be/ecgproductmw/v2/fr/products/?clientCode=CLP&placeId=727&page=1&isAvailable=true&size=10";

    final responseCLP = await dio.get(urlCLP);

    if (responseCLP.statusCode == 200) {
      final result = responseCLP.data["products"];
      Iterable list = result;
      return list.map((product) => ProductsColruyt.fromJson(product)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }

  Future<List> fetchAllProducts() async {
    List shuffle(List items) {
      var random = Random();

      // Go through all elements.
      for (var i = items.length - 1; i > 0; i--) {

        // Pick a pseudorandom number according to the list length
        var n = random.nextInt(i + 1);

        var temp = items[i];
        items[i] = items[n];
        items[n] = temp;
      }

      return items;
    }

    var mergedList = [...await fetchProducts(), ...await fetchProductsCLP()];

    return shuffle(mergedList);
  }
}
