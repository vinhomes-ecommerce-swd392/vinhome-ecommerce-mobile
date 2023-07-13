import 'package:json_annotation/json_annotation.dart';
import 'package:vinhomes_ecommerce/models/product.dart';
import 'dart:convert';

@JsonSerializable(includeIfNull: false)
class Order {
  String? id;
  String? address = "";
  String? orderNumber = "10";
  DateTime orderDate;
  String? fcmToken;
  double? total;
  int status;
  String customerId;
  String storeId;

  List<OrderDetail>? orderDetails;
  Order({
    this.id,
    required this.orderDate,
    this.address = "",
    this.fcmToken,
    required this.total,
    required this.status,
    required this.customerId,
    required this.storeId,
    this.orderDetails,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    List orderDetailsJson = json['orderDetails'];

    List<OrderDetail> orderDetails =
        orderDetailsJson != null && orderDetailsJson.isNotEmpty
            ? orderDetailsJson
                .map((detailsJson) => OrderDetail.fromJson(detailsJson))
                .toList()
            : [];

    return Order(
        id: json['id'],
        orderDate: DateTime.parse(json['orderDate']),
        address: json['address'],
        fcmToken: json['fcmToken'],
        total: double.tryParse(json['total'].toString())!,
        status: int.tryParse(json['status'].toString())!,
        customerId: json['customerId'],
        storeId: json['storeId'],
        orderDetails: orderDetails);
  }

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'orderDate': orderDate.toIso8601String(),
  //       'orderNumber': orderNumber,
  //       'address': address,
  //       'total': total,
  //       'customerId': customerId,
  //       'storeId': storeId,
  //       'FCMToken': FCMToken,
  //       'status': status,
  //       'orderDetails': orderDetails
  //     };

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};
    void writeIfNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeIfNotNull('id', id);
    writeIfNotNull('orderDate', orderDate.toIso8601String());
    writeIfNotNull('orderNumber', orderNumber);
    writeIfNotNull('address', address);
    writeIfNotNull('total', total);
    writeIfNotNull('customerId', customerId);
    writeIfNotNull('storeId', storeId);
    writeIfNotNull('fcmToken', fcmToken);
    writeIfNotNull('status', status);
    writeIfNotNull('orderDetails', orderDetails);

    return val;
  }
}

enum OrderStatus {
  InCart,
  HasCheckedOut,
  Cancelled,
  Approved,
  Declined,
}

@JsonSerializable(includeIfNull: false)
class OrderDetail {
  String? id;
  int quantity;
  double price;
  String productName;
  String? orderId;
  String productId;
  String? note;

  OrderDetail(
      {this.id,
      required this.quantity,
      required this.price,
      required this.productName,
      required this.productId,
      this.orderId,
      this.note});

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
        id: json['id'],
        quantity: json['quantity'],
        price: double.parse(json['price'].toString()),
        productName: json['productName'],
        orderId: json['orderId'],
        productId: json['productId'],
        note: json['note']);
  }

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};
    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);
    writeNotNull('quantity', quantity);
    writeNotNull('price', price);
    writeNotNull('productName', productName);
    writeNotNull('orderId', orderId);
    writeNotNull('productId', productId);
    writeNotNull('note', note);

    return val;
  }
}
