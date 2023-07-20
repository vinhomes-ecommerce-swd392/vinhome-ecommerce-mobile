import 'dart:convert';

import 'package:vinhomes_ecommerce/models/user.dart';

import '../../resources/utils/fetch_data_exception.dart';
import '../api_urls.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  Future<User> validateGoogleToken(String token) {
    String authHeader = "Bearer " + token;

    var queryParams = {
      'token': authHeader,
    };
    var url = Uri.https(ApiUrls().BASE_API_URL, "${ApiUrls().API_USER_VALIDATION}",queryParams);

    return http.get(url, headers: {"Authorization": authHeader}).then(
        (http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || (jsonBody == null)) {
        print(response.reasonPhrase);
        throw new FetchDataException(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final userContainer = _decoder.convert(jsonBody);

      return User.fromJson(userContainer);

    });
  }
}
