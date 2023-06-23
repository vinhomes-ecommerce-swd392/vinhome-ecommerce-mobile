import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vinhomes_ecommerce/models/product.dart';
import 'dart:convert' as json;

import '../../resources/utils/fetch_data_exception.dart';
import '../api_urls.dart';

class ProductApiServices {
  Future<List<Product>> fetchProductList() {
    var url = Uri.parse(ApiUrls().API_PRODUCTS_LIST);
    return http
    .get(url)
    .then((http.Response response) {
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

  Future<Product> fetchProduct(int id) {
    var url = Uri.parse(ApiUrls().API_PRODUCTS_LIST + '/' + id.toString());
    return http
    .get(url)
    .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new FetchDataException(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);

      return Product.fromJson(useListContainer);
    });
  }
}
