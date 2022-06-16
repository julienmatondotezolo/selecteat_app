class ProductsDelhaize {
  final String name;
  final String imageurl;
  final String baseprice;
  final String bigprice;
  final String? originalprice;
  final String category;
  final String nutriscoreletter;
  final String? itempromotion;
  final String store;
  final String storeproductid;

  ProductsDelhaize({required this.name, required this.imageurl, required this.baseprice, required this.bigprice, required this.category, required this.nutriscoreletter, required this.originalprice, required this.itempromotion, required this.store, required this.storeproductid});

  factory ProductsDelhaize.fromJson(Map<String, dynamic> json) {
    return ProductsDelhaize(
      name: json['name'],
      imageurl: json['fullImage'],
      baseprice: json['price']['basicPrice'].toString(),
      bigprice: json['bigprice'],
      category: json['topCategoryName'],
      nutriscoreletter: json['nutriscoreLabel'],
      originalprice: json['measurementUnitQuantityPrice'],
      itempromotion: "",
      store: "colruyt",
      storeproductid: json['productId'],
    );
  }
}