import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> getUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? userJson = await sharedPreferences.getString("user");
  if (userJson != null) {
    dynamic user = jsonDecode(userJson!);
    return user;
  } else if (userJson == null) {
    return null;
  }
}
