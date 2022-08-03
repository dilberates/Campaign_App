
class Campaign{
  final String campaignId, campaingTitle, campaignDiscrepcion, campaignPhoto;

  Campaign({
    required this.campaignId,
    required this.campaingTitle,
    required this.campaignDiscrepcion,
    required this.campaignPhoto});

  factory Campaign.fromJSON(Map<String, dynamic> json) {
    return Campaign(
        campaignId: json['campaignId'].toString(),
        campaingTitle: json['campaingTitle,'].toString(),
        campaignDiscrepcion: json['campaignDiscrepcion'],
        campaignPhoto: json['campaignPhoto']);
  }
}