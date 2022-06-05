class NearbyStores {
  final String type;
  final Map geometry;
  final Map properties;

  NearbyStores({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory NearbyStores.fromJson(Map<String, dynamic> json) {
    return NearbyStores(
      type: json['type'],
      geometry: json['geometry'],
      properties: json['properties'],
    );
  }
}
