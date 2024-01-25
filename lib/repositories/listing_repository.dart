import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pod1um_flutter_clone/constants/constants.dart';

class ListingRepository {
  http.Client httpClient;
  ListingRepository({required this.httpClient});

  Future<dynamic> getListings(
      {int? searchLimit = 10, int? searchPage = 0}) async {
    final Uri uri = Uri(
        scheme: "https",
        host: kApiUrl,
        path: "/v1/listings",
        queryParameters: {
          "type": "training",
          "searchLimit": "$searchLimit",
          "searchPage": "$searchPage",
        });
    try {
      final http.Response response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        throw Exception(response);
      }
      final listingsJson = json.decode(response.body);
      return listingsJson;
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getListing({required int id}) async {
    final Uri uri =
        Uri(scheme: "https", host: kApiUrl, path: "/v1/listings/${id}");
    try {
      final http.Response response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        throw Exception(response);
      }
      final currentListing = json.decode(response.body);
      return currentListing;
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getListingReviews(
      {required int listingId,
      int? searchLimit = 5,
      int? searchPage = 0}) async {
    final Uri uri = Uri(
        scheme: "https",
        host: kApiUrl,
        path: "/v1/listings/${listingId}/reviews",
        queryParameters: {
          "searchPage": "$searchPage",
          "searchLimit": "$searchLimit",
        });
    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception(response);
      }
      List<dynamic> listingReview = json.decode(response.body);
      return listingReview;
    } catch (error) {
      print(error);
    }
  }
}
