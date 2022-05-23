class Products {
  final String id;
  final String name;
  final String image_url;
  final String baseprice;
  final String bigprice;
  final String originalprice;
  final String item_promotion;
  final String store;
  final String store_product_id;

  Products({required this.id, required this.name, required this.image_url, required this.baseprice, required this.bigprice, required this.originalprice, required this.item_promotion, required this.store, required this.store_product_id});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'],
      image_url: json['image_url'],
      baseprice: json['baseprice'],
      bigprice: json['bigprice'],
      originalprice: json['originalprice'],
      item_promotion: json['item_promotion'],
      store: json['store'],
      store_product_id: json['store_product_id'],
    );
  }
}