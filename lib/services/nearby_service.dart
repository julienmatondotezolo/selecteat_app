import 'package:dio/dio.dart';
import 'package:selecteat_app/models/nearby.dart';

class NearbyService {
  var dio = Dio();
  // var lat = "50.849050";
  // var long = "4.307520";
  // final dynamic lat;
  // final dynamic long;

  // NearbyService({required String this.lat, required String this.long});

  Future<List> fetchNearbyStores(String lat, String long) async {
    String url =
        "https://3cli754824.execute-api.eu-west-3.amazonaws.com/dev/nearbystores/$lat/$long";

    final response = await dio.get(
      url,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
      ),
    );

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['groceryObj']['features'];

      return list
          .map((nearbyStores) => NearbyStores.fromJson(nearbyStores))
          .toList();
    } else {
      throw Exception(response);
    }
  }
}
