class User {
  String? id;
  String name;
  String email;
  String? photoUrl;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        photoUrl = json['photoUrl'];

  // Convert the UserModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}
