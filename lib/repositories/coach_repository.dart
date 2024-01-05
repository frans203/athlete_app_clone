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
      print('response item:');
      print(id);
      print(response);
      if (response.statusCode != 200) {
        throw Exception(response);
      }
      final singleListing = json.decode(response.body);
      return singleListing;
    } catch (error) {
      print(error);
    }
  }
}
