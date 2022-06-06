import 'package:flutter/material.dart';
import 'package:selecteat_app/services/nearby_service.dart';
import 'package:selecteat_app/viewmodels/nearbyStores_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NearbyStoresListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NearbyStoresViewModel> nearbyStoresList = <NearbyStoresViewModel>[];

  void allNearbyStores(double? lat, double? long) async {
    List allNearbyStores = await NearbyService().fetchNearbyStores(lat, long);
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
