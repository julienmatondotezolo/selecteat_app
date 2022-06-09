class ProductsColruyt {
  final String name;
  final String image_url;
  final String baseprice;
  final String bigprice;
  final String? originalprice;
  final String? item_promotion;
  final String store;
  final String store_product_id;

  ProductsColruyt({required this.name, required this.image_url, required this.baseprice, required this.bigprice, required this.originalprice, required this.item_promotion, required this.store, required this.store_product_id});

  factory ProductsColruyt.fromJson(Map<String, dynamic> json) {
    return ProductsColruyt(
      name: json['name'],
      image_url: json['fullImage'],
      baseprice: json['price']['basicPrice'].toString(),
      bigprice: json['bigprice'],
      originalprice: json['measurementUnitQuantityPrice'],
      item_promotion: "",
      store: "colruyt",
      store_product_id: json['productId'],
    );
  }
}