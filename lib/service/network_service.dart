import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:kampanya/model/campaign.dart';

class NetworkService {
  List<Campaign> campaigns = [];

  Future<List<Campaign>> getData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      campaigns = (data['data'] as List).map((json) {
        return Campaign.fromJson(json);
      }
      ).toList();
      if(campaigns is List){
        return campaigns;
      }else{
        print("Empty list");
      }

    } else {
      print("Error in URL");
    }
  }
}