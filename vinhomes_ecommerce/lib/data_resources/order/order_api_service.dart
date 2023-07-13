import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vinhomes_ecommerce/models/order.dart';

import '../../resources/utils/fetch_data_exception.dart';
import '../api_urls.dart';

class OrderApiServices {
  Future<List<Order>> fetchOrderList() {
    var queryParams = {
      'include': 'OrderDetails',
    };
    var url = Uri.https(
        ApiUrls().BASE_API_URL, ApiUrls().API_ORDER_LIST, queryParams);
    return http.get(url).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || (jsonBody == null)) {
        print(response.reasonPhrase);
        throw new FetchDataException(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List orderList = useListContainer;

      return orderList
          .map((contactRaw) => new Order.fromJson(contactRaw))
          .toList();
    });
  }

  Future<List<Order>> fetchOrderListByUser(String userId) {
    var queryParams = {
      'include': 'OrderDetails',
    };
    var url = Uri.https(ApiUrls().BASE_API_URL,
        ApiUrls().API_ORDER_LIST + '/user/' + userId, queryParams);
    return http.get(url).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || (jsonBody == null)) {
        print(response.reasonPhrase);
        throw new FetchDataException(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List orderList = useListContainer;

      return orderList
          .map((contactRaw) => new Order.fromJson(contactRaw))
          .toList();
    });
  }

  Future<Order> fetchOrder(String id) {
    var queryParams = {
      'include': 'OrderDetails',
    };
    var url = Uri.https(ApiUrls().BASE_API_URL,
        ApiUrls().API_ORDER_LIST + '/' + id, queryParams);
    return http.get(url).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new FetchDataException(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder decoder = new JsonDecoder();
      final useListContainer = decoder.convert(jsonBody);

      return Order.fromJson(useListContainer);
    });
  }

  Future<void> postOrder(Order order) async {
    String jsonBody = jsonEncode(order.toJson());
    final response = await http.post(
        Uri.https(ApiUrls().BASE_API_URL, ApiUrls().API_ORDER_LIST),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody);

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to add new order');
    }
  }

  Future<void> putOrder(Order order) async {
    String jsonBody = jsonEncode(order.toJson());
    var url = Uri.https(
        ApiUrls().BASE_API_URL, ApiUrls().API_ORDER_LIST + '/' + order.id!);
    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody);

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to update order');
    }
  }
}
