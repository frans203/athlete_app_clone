import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:pod1um_flutter_clone/constants/constants.dart';

class UserRepository {
  http.Client httpClient;
  UserRepository({required this.httpClient});
  Future<int> followCoach({required int coachId, required String token}) async {
    final Uri uri = Uri(
      scheme: "https",
      host: kApiUrl,
      path: "/v1/users/${coachId}/following",
    );
    try {
      final http.Response responseJson = await httpClient
          .put(uri, headers: {"Authorization": "Bearer $token"});
      return responseJson.statusCode;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<int> unFollowCoach(
      {required int coachId, required String token}) async {
    final Uri uri = Uri(
      scheme: "https",
      host: kApiUrl,
      path: "/v1/users/${coachId}/following",
    );
    try {
      final http.Response responseJson = await httpClient
          .delete(uri, headers: {"Authorization": "Bearer $token"});
      print('teste unf');
      print(responseJson.statusCode);
      return responseJson.statusCode;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<bool?> isFollowingCoach(
      {required int coachId, required String token}) async {
    final Uri uri = Uri(
        scheme: "https", host: kApiUrl, path: "/v1/users/$coachId/following");
    try {
      final http.Response responseJson = await httpClient.get(uri, headers: {
        "Authorization": "Bearer $token",
      });
      print('IS FOLLOWING COACH ${json.decode(responseJson.body)}');
      return json.decode(responseJson.body) as bool;
    } catch (error) {
      print(error);
    }
    return null;
  }
}
