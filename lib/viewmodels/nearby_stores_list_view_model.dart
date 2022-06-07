import 'package:flutter/material.dart';
import 'package:selecteat_app/services/nearby_service.dart';
import 'package:selecteat_app/viewmodels/nearbyStores_view_model.dart';
import 'package:location/location.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

Location location = Location();

Future<LocationData> _determinePosition() async {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    // if (!_serviceEnabled) {
    //   return Future.error("Location permissions are disabled");
    // }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return Future.error("Location permissions are denied.");
    }
  }

  location.enableBackgroundMode(enable: true);

  _locationData = await location.getLocation();

  return _locationData;
}

class NearbyStoresListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NearbyStoresViewModel> nearbyStoresList = <NearbyStoresViewModel>[];
  LocationData? position;

  void allNearbyStores() async {
    position = await _determinePosition();

    List allNearbyStores = await NearbyService()
        .fetchNearbyStores(position!.latitude, position!.longitude);
    notifyListeners();

    nearbyStoresList = allNearbyStores
        .map((nearbyStore) => NearbyStoresViewModel(nearbyStores: nearbyStore))
        .toList();

    if (nearbyStoresList.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
