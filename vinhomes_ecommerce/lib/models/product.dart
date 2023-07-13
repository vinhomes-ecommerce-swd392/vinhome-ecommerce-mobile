class Product {
  String? id;
  String name;
  String? description;
  double price;
  String imageUrl;
  String? storeId;

  Product(
      {this.id,
      required this.name,
      this.description,
      required this.price,
      required this.imageUrl,
      this.storeId});

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = double.tryParse(json['price'].toString())!,
        imageUrl = json['imageUrl'],
        storeId = json['storeId'];
}
