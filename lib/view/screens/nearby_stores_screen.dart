import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/widgets/nearby_stores_list.dart';
import 'package:selecteat_app/viewmodels/nearbyStores_view_model.dart';
import 'package:selecteat_app/viewmodels/nearby_stores_list_view_model.dart';

class NearbyStoreScreen extends StatefulWidget {
  const NearbyStoreScreen({Key? key}) : super(key: key);

  @override
  State<NearbyStoreScreen> createState() => _NearbyStoreScreenState();
}

class _NearbyStoreScreenState extends State<NearbyStoreScreen> {
  Position? _position;

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _position = position;
    });

    Provider.of<NearbyStoresListViewModel>(context, listen: false)
        .allNearbyStores(position.latitude.toString(), position.longitude.toString());
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<NearbyStoresListViewModel>(context, listen: false).allNearbyStores(_position!.latitude, _position!.longitude);
  // }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();

    var nearbyStoreslistViewModel =
        Provider.of<NearbyStoresListViewModel>(context);
    var size = MediaQuery.of(context).size;

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

    return Scaffold(
      body: Stack(
        children: [
          _position != null
              ? FlutterMap(
                  options: MapOptions(
                    center: LatLng(_position!.latitude, _position!.longitude),
                    zoom: 14.5,
                  ),
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
                          point: LatLng(50.841701, 4.32155),
                          builder: (ctx) => const FlutterLogo(),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: const [
                    Expanded(
                        child: Center(
                            child: CircularProgressIndicator(
                                color: brandPrimaryColor))),
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
                    onPressed: _getCurrentLocation,
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
}
