import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../model/campaign.dart';

class campaignCard extends StatelessWidget {
  const campaignCard({
    Key key,
    @required this.campaign,
  }) : super(key: key);

  final Campaign campaign;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: InkWell(
        onTap: () {

        },
        child: GFCard(
          elevation: 20,
          boxFit: BoxFit.cover,
          image: Image.network(campaign.campaignPhoto,
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
        ),
      ),
    );
  }
}