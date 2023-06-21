import 'dart:ffi';

class Store {
  int? id;
  int? userID;
  int? buildingID;
  String? storeName;
  double? contactPhone;
  String? contactMail;
  String? contactFacebook;
  double? contactZalo;

  Store(this.id, 
        this.userID, 
        this.buildingID, 
        this.storeName, 
        this.contactPhone, 
        this.contactMail, 
        this.contactFacebook, 
        this.contactZalo);

  Store.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json['id'].toString()),
        userID = json['userID'],
        buildingID = json['buildingId'],
        storeName = json['storeName'],
        contactPhone = json['contactPhone'],
        contactMail = json['contactMail'],
        contactFacebook = json['contactFacebook'],
        contactZalo = json['contactZalo'];
        
}