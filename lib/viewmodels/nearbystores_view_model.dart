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

  String get distance {
    var distance = properties["distance"].toString();
    var formatDistance =
        distance.length > 5 ? distance.substring(0, 5) : distance;

    if (formatDistance.length < 4 && formatDistance.contains(".")) {
      formatDistance = formatDistance + "00";
    }

    // return formatDistance;

    if (formatDistance[0] == "0") {
      return formatDistance.replaceAll('0.', ' ') + " m";
    }

    if (formatDistance.contains(".")) {
      formatDistance = formatDistance.substring(0, formatDistance.length - 2);
    }

    return formatDistance.replaceAll('.', ',') + " km";
  }
}
