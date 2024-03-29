import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pod1um_flutter_clone/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  http.Client httpClient;
  LoginRepository({required this.httpClient});

  Future<dynamic> login(
      {required String email, required String password}) async {
    final Uri uri = Uri(
      scheme: "https",
      host: kApiUrl,
      path: "/v1/auth/login",
    );
    try {
      final http.Response response = await httpClient.post(uri, body: {
        "email": "$email",
        "password": "$password",
      });

      final user = json.decode(response.body);
      if (user['statusCode'] == 401) {
        throw user;
      }
      if (user['token'] != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("user", response.body);
      }
      return user;
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
