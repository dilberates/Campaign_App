import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:kampanya/model/campaign.dart';

class NetworkService {
  List<Campaign> campaigns = [];

  Future<dynamic> getData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("içerik var");
      final data = jsonDecode(response.body);
      campaigns = (data['data'] as List).map((json) {
        return Campaign.fromJson(json);
      }
      ).toList();
      print("içerik yollandı");
      return campaigns;
    }else if (response.statusCode == 204) {
      print("İçerik yok ");
    }else if (response.statusCode == 404) {
      print("sayfa yok ");
    } else {
      print("Error in URL");
    }
  }
}