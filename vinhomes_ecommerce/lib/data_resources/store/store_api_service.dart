import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vinhomes_ecommerce/models/store.dart';
import 'dart:convert' as json;

import '../../resources/utils/fetch_data_exception.dart';
import '../api_urls.dart';

class StoreApiServices {
  Future<List<Store>> fetchStoreList() {
    var url = Uri.parse(ApiUrls().API_STORE_LIST);
    return http.get(url).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new FetchDataException(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer;

      return userList
          .map((contactRaw) => new Store.fromJson(contactRaw))
          .toList();
    });
  }

  Future<Store> fetchStore(int id) {
    var url = Uri.parse(ApiUrls().API_STORE_LIST + '/' + id.toString());
    return http.get(url).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new FetchDataException(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);

      return Store.fromJson(useListContainer);
    });
  }
}