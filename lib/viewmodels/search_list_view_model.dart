import 'package:flutter/material.dart';
import 'package:selecteat_app/services/search_service.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class SearchListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<dynamic> searchListSuggestion = [];
  List<ProductViewModel> searchListResult = [];

  late String searchTerm;

  void searchSuggestion(searchTerm) async {
    List<dynamic> allSearchSuggestion =
        await SearchService().fetchSuggestion(searchTerm);
    notifyListeners();

    searchListSuggestion = allSearchSuggestion;

    if (searchListSuggestion.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void searchResult(searchTerm) async {
    // List allProducts = await ProductService().fetchProducts();
    List allResult = await SearchService().fetchAllSearch(searchTerm);
    notifyListeners();

    searchListResult = allResult
        .map((product) => ProductViewModel(product: product))
        .toList();

    if (searchListResult.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
