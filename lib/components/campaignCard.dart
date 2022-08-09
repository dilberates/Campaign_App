import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../model/campaign.dart';
import '../pages/detailPage.dart';

class campaignCard extends StatelessWidget {
  const campaignCard({
    Key key,
    @required this.campaign,
  }) : super(key: key);

  final Campaign campaign;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailCampaign(campaign.campaignId,
                campaign.campaingTitle,
                campaign.campaignDiscrepcion,
                campaign.campaignPhoto,
              )));
        },
        child: cardView(campaign: campaign),
    );
  }
}

class cardView extends StatelessWidget {
  const cardView({
    Key key,
    @required this.campaign,
  }) : super(key: key);

  final Campaign campaign;

  @override
  Widget build(BuildContext context) {
    return GFCard(
      padding: EdgeInsets.zero,
      elevation: 20,
      boxFit: BoxFit.cover,
      image: Image.network(campaign.campaignPhoto,
        fit: BoxFit.fill,
      ),
      showImage: true,
      title: GFListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            campaign.campaingTitle,
            style: Theme
                .of(context)
                .textTheme
                .headline6,
            textAlign: TextAlign.center,
          ),
        ),
        subTitle: Text(
          campaign.campaignDiscrepcion,
          style: Theme
              .of(context)
              .textTheme
              .bodyText1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}