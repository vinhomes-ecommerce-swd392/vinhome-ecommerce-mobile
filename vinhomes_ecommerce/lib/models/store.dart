class Store {
  String? id;
  String? name;
  String? description;
  String? address;
  String imageUrl;
  String? storeOwnerId;

  Store(this.id, this.storeOwnerId, this.name, this.address, this.description,
      this.imageUrl);

  Store.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        address = json['address'],
        description = json['description'],
        storeOwnerId = json['storeOwnerId'],
        imageUrl = json['imageUrl'];
}
