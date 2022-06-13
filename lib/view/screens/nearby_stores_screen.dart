import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/bottomnav.dart';
import 'package:selecteat_app/view/widgets/nearby_stores_list.dart';
import 'package:selecteat_app/viewmodels/nearby_stores_list_view_model.dart';
import 'package:location/location.dart';

class NearbyStoreScreen extends StatefulWidget {
  const NearbyStoreScreen({Key? key}) : super(key: key);

  @override
  State<NearbyStoreScreen> createState() => _NearbyStoreScreenState();
}

class _NearbyStoreScreenState extends State<NearbyStoreScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NearbyStoresListViewModel>(context, listen: false)
        .allNearbyStores();
  }

  // final MapController _mapController = MapController();
  MapController? _mapController;

  void _gotoLocation(double lat, double long) {
    _mapController!.move(LatLng(lat, long), _mapController!.zoom);
  }

  @override
  Widget build(BuildContext context) {
    var nearbyStoreslistViewModel =
        Provider.of<NearbyStoresListViewModel>(context);
    var size = MediaQuery.of(context).size;

    LocationData? _position = nearbyStoreslistViewModel.position;

    List<Marker> _buildMarkers() {
      final _markersList = <Marker>[];

      for (int i = 0;
          i < nearbyStoreslistViewModel.nearbyStoresList.length;
          i++) {
        final mapItem = nearbyStoreslistViewModel.nearbyStoresList[i];

        _markersList.add(
          Marker(
            width: 50,
            height: 50,
            point: LatLng(mapItem.geometry["coordinates"][1],
                mapItem.geometry["coordinates"][0]),
            builder: (_) => Image(
                image: Svg(
              mapItem.logoStore,
              source: SvgSource.network,
            )),
          ),
        );
      }
      return _markersList;
    }

    final _markers = _buildMarkers();

    if (_position == null) {
      return Scaffold(
        body: Container(
          width: size.width,
          color: brandLightGreyColor,
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(color: brandPrimaryColor),
              SizedBox(
                height: 40,
              ),
              Text(
                "Searching all nearby stores..",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: brandDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              onMapCreated: (c) {
                _mapController = c;
              },
              center: LatLng(_position.latitude!, _position.longitude!),
              zoom: 14.5,
            ),
            mapController: _mapController,
            nonRotatedLayers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/julienmt/ckx6t9wl86f0u14nqm714f3th/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoianVsaWVubXQiLCJhIjoiY2s5aGlyNTllMHY3dzNlanczdnRldnFzaCJ9.XzX5C2Y_iiX7Ob33KunkfQ",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoianVsaWVubXQiLCJhIjoiY2s5aGlyNTllMHY3dzNlanczdnRldnFzaCJ9.XzX5C2Y_iiX7Ob33KunkfQ',
                    'id': 'mapbox.mapbox-streets-v11'
                  }),
              MarkerLayerOptions(
                markers: _markers,
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    // width: 50.0,
                    // height: 50.0,
                    point: LatLng(_position.latitude!, _position.longitude!),
                    builder: (ctx) => const FlutterLogo(),
                  ),
                ],
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () => _gotoLocation(
                        _position.latitude!, _position.longitude!),
                    child: const Icon(Icons.my_location),
                    backgroundColor: brandPrimaryColor,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: size.height / 2.2,
                    child: NearbyStoresList(
                        nearbyStoresList:
                            nearbyStoreslistViewModel.nearbyStoresList),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   _mapController.dispose();
  //   super.dispose();
  // }

}
