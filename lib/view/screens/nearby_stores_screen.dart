import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NearbyStoreScreen extends StatelessWidget {
  const NearbyStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://api.mapbox.com/styles/v1/julienmt/ckx6t9wl86f0u14nqm714f3th/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoianVsaWVubXQiLCJhIjoiY2s5aGlyNTllMHY3dzNlanczdnRldnFzaCJ9.XzX5C2Y_iiX7Ob33KunkfQ",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoianVsaWVubXQiLCJhIjoiY2s5aGlyNTllMHY3dzNlanczdnRldnFzaCJ9.XzX5C2Y_iiX7Ob33KunkfQ',
            'id': 'mapbox.mapbox-streets-v11'
          }
        ),
        // MarkerLayerOptions(
        //   markers: [
        //     Marker(
        //       width: 80.0,
        //       height: 80.0,
        //       point: LatLng(51.5, -0.09),
        //       builder: (ctx) => Container(
        //         child: FlutterLogo(),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
