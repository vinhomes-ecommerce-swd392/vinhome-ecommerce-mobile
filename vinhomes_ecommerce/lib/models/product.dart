class Product {
  int? id;
  String name;
  double originalPrice;
  String? description;
  String productUrl;

  Product(
      {this.id,
      required this.name,
      required this.originalPrice,
      this.description,
      required this.productUrl});

  Product.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json['id'].toString()),
        name = json['name'],
        originalPrice = double.tryParse(json['originalPrice'].toString())!,
        description = json['description'],
        productUrl = json['productUrl'];
}
