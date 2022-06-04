import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:selecteat_app/utils/constants.dart';

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
  }

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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          _position != null
              ? FlutterMap(
                  options: MapOptions(
                    center: LatLng(_position!.latitude, _position!.longitude),
                    zoom: 14.5,
                  ),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            "https://api.mapbox.com/styles/v1/julienmt/ckx6t9wl86f0u14nqm714f3th/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoianVsaWVubXQiLCJhIjoiY2s5aGlyNTllMHY3dzNlanczdnRldnFzaCJ9.XzX5C2Y_iiX7Ob33KunkfQ",
                        additionalOptions: {
                          'accessToken':
                              'pk.eyJ1IjoianVsaWVubXQiLCJhIjoiY2s5aGlyNTllMHY3dzNlanczdnRldnFzaCJ9.XzX5C2Y_iiX7Ob33KunkfQ',
                          'id': 'mapbox.mapbox-streets-v11'
                        }),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 50.0,
                          height: 50.0,
                          point: LatLng(50.841701, 4.32155),
                          builder: (ctx) => const FlutterLogo(),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(height: size.height, color: brandPrimaryLightColor),
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
                    height: size.height / 2.8,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          height: 100,
                          decoration: BoxDecoration(
                            color: brandLightGreyColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 10),
                            ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Colruyt Anderlecht",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                      "Av. Marius Renard 21, 1070 Anderlecht"),
                                  RichText(
                                    text: const TextSpan(children: [
                                      TextSpan(
                                        text: "Distance: ",
                                        style: TextStyle(
                                          color: brandDarkColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "1500m",
                                        style: TextStyle(
                                          color: brandDarkColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                              const TextButton(
                                onPressed: null,
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: brandPrimaryColor,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
