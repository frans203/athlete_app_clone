import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pod1um_flutter_clone/constants/constants.dart';

class CoachRepository {
  http.Client httpClient;
  CoachRepository({required this.httpClient});

  Future<dynamic> getSingleCoach({required int id}) async {
    final Uri uri =
        Uri(scheme: "https", host: kApiUrl, path: "/v1/users/${id}");
    try {
      final http.Response response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        throw Exception(response);
      }
      final singleListing = json.decode(response.body);
      return singleListing;
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getListingsByCoach({required int coachId}) async {
    final Uri uri = Uri(
        scheme: "https",
        host: kApiUrl,
        path: "/v1/listings",
        queryParameters: {"coachId": "$coachId", "type": "training"});

    try {
      final http.Response response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        throw Exception(response);
      }
      final coachListings = json.decode(response.body);
      return coachListings;
    } catch (error) {
      print(error);
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
      return json.decode(responseJson.body) as bool;
    } catch (error) {
      print(error);
    }
    return null;
  }
}
