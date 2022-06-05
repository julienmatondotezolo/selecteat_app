import 'package:selecteat_app/models/nearby.dart';

class NearbyStoresViewModel {
  final NearbyStores _nearbyStores;

  NearbyStoresViewModel({required NearbyStores nearbyStores})
      : _nearbyStores = nearbyStores;

  String get type {
    return _nearbyStores.type;
  }

  Map get geometry {
    return _nearbyStores.geometry;
  }

  Map get properties {
    return _nearbyStores.properties;
  }
}
