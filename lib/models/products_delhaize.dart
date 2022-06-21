class ProductsDelhaize {
  final String name;
  final String imageurl;
  final String baseprice;
  final String bigprice;
  final String? originalprice;
  final String category;
  final String nutriscoreletter;
  final String? itempromotion;
  final String? quantity;
  final String store;
  final String storeproductid;

  ProductsDelhaize({required this.name, required this.imageurl, required this.baseprice, required this.bigprice, required this.category, required this.nutriscoreletter, required this.originalprice, required this.itempromotion, required this.store, required this.storeproductid, required this.quantity,});

  factory ProductsDelhaize.fromJson(Map<String, dynamic> json) {
    return ProductsDelhaize(
      name: json['name'],
      imageurl: "https://www.delhaize.be/" + json['images'][3]["url"],
      baseprice: json["price"]["value"].toString(),
      bigprice: json["price"]["unitPrice"].toString(),
      category: json["url"],
      nutriscoreletter: json['nutriScoreLetter'],
      originalprice: json["price"]["supplementaryPriceLabel1"],
      itempromotion: "",
      quantity: null,
      store: "delhaize",
      storeproductid: json['code'],
    );
  }
}