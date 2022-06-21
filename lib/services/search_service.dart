import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:selecteat_app/models/products.dart';
import 'package:selecteat_app/models/products_colruyt.dart';
import 'package:selecteat_app/models/products_delhaize.dart';

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

  Future<List<ProductsColruyt>> fetchSearchCLP(searchTerm) async {
    var dio = Dio();
    dio.options.headers['X-CG-APIKey'] = 'a8ylmv13-b285-4788-9e14-0f79b7ed2411';

    int page = 1;
    String placeId = "455";
    String size = "10";
    String urlCLP =
        "https://apip.colruyt.be/gateway/ictmgmt.emarkecom.cgproductsearchsvc.v2/v1/fr/products?clientCode=CLP&isAvailable=true&page=${page.toString()}&placeId=$placeId&searchTerm=$searchTerm&size=$size&ts=1654641965327";
    print(urlCLP);
    final responseCLP = await dio.get(urlCLP);
    if (responseCLP.statusCode == 200) {
      final result = responseCLP.data["products"];
      Iterable list = result;
      return list.map((product) => ProductsColruyt.fromJson(product)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }

  Future<List<ProductsDelhaize>> fetchSearchDelhaize(searchTerm) async {
    int page = 0;
    String placeId = "455";
    String size = "10";
    String urlCLP =
        'https://api.delhaize.be/?operationName=GetProductSearch&variables={"lang":"fr","searchQuery":"$searchTerm","pageNumber":${page.toString()},"pageSize":$size,"filterFlag":true,"useSpellingSuggestion":true}&extensions={"persistedQuery":{"version":1,"sha256Hash":"d35a68b909fdfc67c6911c7fa14700ddecb1b170e805715a2bf7419ab73b157e"}}';
    print(urlCLP);
    final responseCLP = await dio.get(urlCLP);

    if (responseCLP.statusCode == 200) {
      final result = responseCLP.data["data"]["productSearch"]["products"];
      Iterable list = result;
      return list.map((product) => ProductsDelhaize.fromJson(product)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }

  Future<List<Products>> fetchSearch(searchTerm) async {
    String url =
        "https://3cli754824.execute-api.eu-west-3.amazonaws.com/dev/search?query=$searchTerm";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((product) => Products.fromJson(product)).toList();
    } else {
      throw Exception("Failled to get product data");
    }
  }

  // FutureOr<List<dynamic>> fetchBalanced(ingredientsParsed) async {
  Future<List?> fetchBalanced(ingredientsParsed) async {
    for (var ingredient in ingredientsParsed) {
      var searchTerm = ingredient['name'];
      String url =
          "https://3cli754824.execute-api.eu-west-3.amazonaws.com/dev/search?query=$searchTerm";

      Response<dynamic> response = await dio.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final result = response.data;
        Iterable list = result;
        list.map((product) => Products.fromJson(product)).toList();
      } else {
        throw Exception("Failled to get product data");
      }
    }

    return null;
  }

  Future<List> fetchAllSearch(searchTerm) async {
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

    var mergedList = [...await fetchSearch(searchTerm)];
    // var mergedList = [
    //   ...await fetchSearchDelhaize(searchTerm),
    //   ...await fetchSearchCLP(searchTerm)
    // ];

    return shuffle(mergedList);
  }
}
