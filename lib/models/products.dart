class Products {
  final String name;
  final String imageurl;
  final String baseprice;
  final String bigprice;
  final String category;
  final String nutriscoreletter;
  final String? originalprice;
  final String? itempromotion;
  final int? quantity;
  final String store;
  final String storeproductid;

  Products(
      {required this.name,
      required this.imageurl,
      required this.baseprice,
      required this.bigprice,
      required this.category,
      required this.nutriscoreletter,
      required this.originalprice,
      required this.itempromotion,
      required this.quantity,
      required this.store,
      required this.storeproductid});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      name: json['name'],
      imageurl: json['imageurl'],
      baseprice: json['baseprice'],
      bigprice: json['bigprice'],
      category: json['category'],
      nutriscoreletter: json['nutriscoreletter'],
      originalprice: json['originalprice'],
      itempromotion: json['itempromotion'],
      quantity: null,
      store: json['store'],
      storeproductid: json['storeproductid'],
    );
  }
}
