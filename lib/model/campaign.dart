
class Campaign{
  final String campaignId, campaingTitle, campaignDiscrepcion, campaignPhoto;

  Campaign({
     this.campaignId,
    this.campaingTitle,
   this.campaignDiscrepcion,
    this.campaignPhoto});

  factory Campaign.fromJSON(Map<String, dynamic> json) {
    return Campaign(
        campaignId: json['campaignId'].toString(),
        campaingTitle: json['campaingTitle,'].toString(),
        campaignDiscrepcion: json['campaignDiscrepcion'],
        campaignPhoto: json['campaignPhoto']);
  }
}