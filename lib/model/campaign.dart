
import 'dart:convert';

Campaign welcomeFromJson(String str) => Campaign.fromJson(json.decode(str));

String welcomeToJson(Campaign data) => json.encode(data.toJson());

class Campaign {
  Campaign({
    this.campaignId,
    this.campaingTitle,
    this.campaignDiscrepcion,
    this.campaignPhoto,
  });

  String campaignId;
  String campaingTitle;
  String campaignDiscrepcion;
  String campaignPhoto;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
    campaignId: json["campaignId"],
    campaingTitle: json["campaingTitle"],
    campaignDiscrepcion: json["campaignDiscrepcion"],
    campaignPhoto: json["campaignPhoto"],
  );

  Map<String, dynamic> toJson() => {
    "campaignId": campaignId,
    "campaingTitle": campaingTitle,
    "campaignDiscrepcion": campaignDiscrepcion,
    "campaignPhoto": campaignPhoto,
  };
}
