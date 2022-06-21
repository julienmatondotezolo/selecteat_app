import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:selecteat_app/models/products.dart';

class ProductViewModel {
  final _products;

  ProductViewModel({required product}) : _products = product;

  String get name {
    return _products.name;
  }

  String get imageurl {
    var image = _products.imageurl;
    if (image.contains("?buildNumber=")) {
      return image.split('?buildNumber')[0];
    }
    return _products.imageurl;
  }

  String get baseprice {
    var price = _products.baseprice;
    var quantity = _products.quantity;

    if (_products.quantity == null) quantity = 1;

    if (price.contains('€ ')) {
      var priceToDouble =
          double.parse(price.replaceAll('€', '').replaceAll(',', '.'));
      var priceTotal = priceToDouble * quantity;
      return '€ ' + priceTotal.toStringAsFixed(2).replaceAll('.', ',');
    }
    return '€ ' + (price * quantity).toStringAsFixed(2).replaceAll('.', ',');
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

  int? get quantity {
    if (_products.quantity == null) return 1;
    return _products.quantity;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageurl': imageurl,
        'baseprice': baseprice,
        'bigprice': bigprice,
        'category': category,
        'nutriscoreletter': nutriscoreletter,
        'originalprice': originalprice,
        'itempromotion': itempromotion,
        'store': store,
        'storeproductid': storeproductid,
      };
}
