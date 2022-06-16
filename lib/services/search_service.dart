import 'dart:math';

import 'package:dio/dio.dart';

class SearchService {
  var dio = Dio();

  Future<List> fetchSuggestion(searchTerm) async {
    String url =
        'https://api.delhaize.be/?operationName=HeaderSearchAutocomplete&variables=%7B%22skipManufacturerName%22%3Afalse%2C%22term%22%3A%22$searchTerm%22%2C%22channel%22%3A%22Web%22%2C%22lang%22%3A%22fr%22%2C%22uniqueId%22%3A%220.gagami0i2pi%22%7D&extensions=%7B%22persistedQuery%22%3A%7B%22version%22%3A1%2C%22sha256Hash%22%3A%2262dba016cbe211fd2c9272e7e22a826288a77d0920b4bb67032ee16db3d031ab%22%7D%7D';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data["data"]["searchAutocomplete"]["dictionary"];
      List list = result;
      return list;
    } else {
      throw Exception("Failled to get product data");
    }
  }

  // Future<List> fetchAllProducts() async {
  //   List shuffle(List items) {
  //     var random = Random();

  //     // Go through all elements.
  //     for (var i = items.length - 1; i > 0; i--) {
  //       // Pick a pseudorandom number according to the list length
  //       var n = random.nextInt(i + 1);

  //       var temp = items[i];
  //       items[i] = items[n];
  //       items[n] = temp;
  //     }

  //     return items;
  //   }

  //   var mergedList = [...await fetchProducts(), ...await fetchProductsCLP()];

  //   return shuffle(mergedList);
  // }
}
