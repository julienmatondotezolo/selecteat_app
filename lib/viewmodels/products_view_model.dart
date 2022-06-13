import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:selecteat_app/models/products.dart';

class ProductViewModel {
  final _products;

  ProductViewModel({required product}) : _products = product;

  String get name {
    return _products.name;
  }

  String get imageurl {
    return _products.imageurl;
  }

  String get baseprice {
    return _products.baseprice;
  }

  String get bigprice {
    return _products.bigprice;
  }

  String get category {
    return _products.category;
  }

  String get nutriscoreletter {
    return _products.nutriscoreletter;
  }

  String? get originalprice {
    return _products.originalprice;
  }

  String? get itempromotion {
    return _products.itempromotion;
  }

  String get store {
    return _products.store;
  }

  String get storeproductid {
    return _products.storeproductid;
  }
}