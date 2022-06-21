import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:selecteat_app/services/meals_service.dart';
import 'package:selecteat_app/services/search_service.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

enum LoadingStatus { completed, searching, empty, carrefour, colruyt, delhaize, delhaizeEmpty }

class SelectEatController with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<ProductViewModel> carrefourList = [];
  List<ProductViewModel> colruytList = [];
  List<ProductViewModel> delhaizeList = [];
  List allResult = [];

  void balanced(ingredients) async {
    var ingredientsParsed = jsonDecode(ingredients);
    for (var ingredient in ingredientsParsed) {
      List? delhaizeResult =
          await SearchService().fetchBalanced(ingredient["name"]);
      // allResult.addAll(delhaizeResult);
    }

    delhaizeList = allResult
        .map((product) => ProductViewModel(product: product))
        .toList();

    if (delhaizeList.isNotEmpty) {
      loadingStatus = LoadingStatus.delhaize;
    }
    notifyListeners();
  }
}
