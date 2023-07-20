import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinhomes_ecommerce/models/product.dart';

import '../../resources/utils/fetch_data_exception.dart';
import '../api_urls.dart';

class ProductApiServices {
  Future<List<Product>> fetchProductList() async {
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwt = prefs.getString("jwtToken");
    String authHeader = "Bearer " + jwt!;
    
    var url = Uri.https(ApiUrls().BASE_API_URL, ApiUrls().API_PRODUCTS_LIST);
    return http.get(url, headers: {"Authorization": authHeader}).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || (jsonBody == null)) {
        print(response.reasonPhrase);
        throw new FetchDataException(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer;

      return userList
          .map((contactRaw) => new Product.fromJson(contactRaw))
          .toList();
    });
  }

  Future<Product> fetchProduct(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwt = prefs.getString("jwtToken");
    String authHeader = "Bearer " + jwt!;
    var url =
        Uri.https(ApiUrls().BASE_API_URL, ApiUrls().API_PRODUCTS_LIST + '/' + id);
    return http.get(url, headers: {"Authorization": authHeader}).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new FetchDataException(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder decoder = JsonDecoder();
      final useListContainer = decoder.convert(jsonBody);

      return Product.fromJson(useListContainer);
    });
  }
}
