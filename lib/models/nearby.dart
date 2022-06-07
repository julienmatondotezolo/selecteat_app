class NearbyStores {
  final String type;
  final Map geometry;
  final Map properties;
  final Map address;

  NearbyStores({
    required this.type,
    required this.geometry,
    required this.properties,
    required this.address,
  });

  factory NearbyStores.fromJson(Map<String, dynamic> json) {
    return NearbyStores(
      type: json['type'],
      geometry: json['geometry'],
      properties: json['properties'],
      address: json['properties']['address'],
    );
  }
}
