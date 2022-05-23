import 'package:flutter/cupertino.dart';
import 'package:selecteat_app/models/products.dart';
import 'package:selecteat_app/services/web_service.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ProductsListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<ProductViewModel> productsList = <ProductViewModel>[];

  void topHeadlines() async {
    List<Products> allProducts = await WebService().fetchProducts();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    productsList = allProducts
        .map((product) => ProductViewModel(products: product))
        .toList();

    if (productsList.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
