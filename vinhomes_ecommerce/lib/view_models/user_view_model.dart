import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinhomes_ecommerce/data_resources/user/user_api_service.dart';
import 'package:vinhomes_ecommerce/models/user.dart';

class UserViewModel with ChangeNotifier {
  User? user;
  String? token;

  getValidateUser(String token) async {
    this.user = await UserApiService().validateGoogleToken(token);
    this.token = token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("jwtToken", token);
    prefs.setString("userInfo", jsonEncode(user));

    print("User ${jsonEncode(user)}");
  }
}
