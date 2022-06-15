import 'package:flutter/material.dart';
import 'package:selecteat_app/services/favourites_service.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class FavouritesController with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<ProductViewModel> favouritesList = <ProductViewModel>[];
  bool exists = false;

  void checkFavouritesList(uid, product) async {
    final result = await FavouritesService()
        .checkIfExistInFavourites(uid: uid, product: product);
    exists = result;
    notifyListeners();
  }

  void addFavouritesList(uid, product) async {
    await FavouritesService().addToFavourites(uid: uid, product: product);
    notifyListeners();
  }

  void removeFavouritesFromList(uid, product) async {
    await FavouritesService().removeFromFavourites(uid: uid, product: product);
    notifyListeners();
  }

  void clearFavourites(uid) async {
    await FavouritesService().clearFavourites(uid: uid);
    notifyListeners();
  }

  void getFavouritesList(uid) async {
    List allProductList = await FavouritesService().getFavourites(uid: uid);
    favouritesList = allProductList
        .map((product) => ProductViewModel(product: product))
        .toList();

    if (favouritesList.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
