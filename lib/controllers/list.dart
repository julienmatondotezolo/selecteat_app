import 'package:flutter/material.dart';
import 'package:selecteat_app/services/list_service.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ListController with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<ProductViewModel> productsList = <ProductViewModel>[];
  bool exists = false;

  void checkProductList(uid, product) async {
    final result =
        await ListService().checkIfExistInList(uid: uid, product: product);
    exists = result;
    notifyListeners();
  }

  void addProductList(uid, product) async {
    await ListService().addToList(uid: uid, product: product);
    notifyListeners();
  }

  void removeProductFromList(uid, product) async {
    await ListService().removeFromList(uid: uid, product: product);
    notifyListeners();
  }

  void updateProductList(uid, product, count) async {
    await ListService().updateList(uid: uid, product: product, count: count);
    notifyListeners();
  }

  void clearList(uid) async {
    await ListService().clearList(uid: uid);
    notifyListeners();
  }

  void getProductList(uid) async {
    List allProductList = await ListService().getList(uid: uid);
    productsList = allProductList
        .map((product) => ProductViewModel(product: product))
        .toList();

    if (productsList.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
