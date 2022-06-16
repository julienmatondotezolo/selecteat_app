import 'package:flutter/material.dart';
import 'package:selecteat_app/services/search_service.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class SearchListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<dynamic> searchListSuggestion = [];

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
}
