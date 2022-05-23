import 'package:flutter/cupertino.dart';
import 'package:selecteat_app/models/products.dart';
import 'package:selecteat_app/services/product_service.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ProductsListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<ProductViewModel> productsList = <ProductViewModel>[];

  void allProducts() async {
    List<Products> allProducts = await ProductService().fetchProducts();
    notifyListeners();

    productsList = allProducts
        .map((product) => ProductViewModel(product: product))
        .toList();

    if (productsList.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void similarProducts() async {
    //
  }
}
