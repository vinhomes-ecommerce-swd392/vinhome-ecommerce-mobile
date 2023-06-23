class Store {
  int? id;
  int? userID;
  int? buildingID;
  String? storeName;
  String? contactPhone;
  String? contactMail;
  String? contactFacebook;
  String? contactZalo;
  String storeUrl;

  Store(
      this.id,
      this.userID,
      this.buildingID,
      this.storeName,
      this.contactPhone,
      this.contactMail,
      this.contactFacebook,
      this.contactZalo,
      this.storeUrl);

  Store.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json['id'].toString()),
        userID = int.tryParse(json['userID'].toString()),
        buildingID = int.tryParse(json['buildingId'].toString()),
        storeName = json['storeName'],
        contactPhone = json['contactPhone'],
        contactMail = json['contactMail'],
        contactFacebook = json['contactFacebook'],
        contactZalo = json['contactZalo'],
        storeUrl = json['storeUrl'];
}
