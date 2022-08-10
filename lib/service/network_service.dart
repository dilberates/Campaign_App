import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:kampanya/model/campaign.dart';

class NetworkService {
  List<Campaign> campaigns = [];

  Future<dynamic> getData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      campaigns = (data['data'] as List).map((json) {
        return Campaign.fromJson(json);
      }
      ).toList();
      return campaigns;
    } else {
      print("Error in URL");
    }
  }
}