import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:selecteat_app/models/products.dart';
import 'package:selecteat_app/models/productsColruyt.dart';

class ProductViewModel {
  final Products _products;

  ProductViewModel({required Products product}) : _products = product;

  String get name {
    return _products.name;
  }

  String get image_url {
    return _products.image_url;
  }

  String get baseprice {
    return _products.baseprice;
  }

  String get bigprice {
    return _products.bigprice;
  }

  String? get originalprice {
    return _products.originalprice;
  }

  String? get item_promotion {
    return _products.item_promotion;
  }

  String get store {
    return _products.store;
  }

  String get store_product_id {
    return _products.store_product_id;
  }
}