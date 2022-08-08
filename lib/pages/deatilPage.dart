
import 'package:flutter/material.dart';

import '../constants.dart';

class DetailCampaign extends StatelessWidget {
  final id;
  final String campaingTitle, campaignDiscrepcion, campaignPhoto;
  const DetailCampaign(this.id,
      this.campaingTitle,
      this.campaignDiscrepcion,
      this.campaignPhoto,
      {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(MyConstans.appBarText),
      ),
      body:Container(
        padding: const EdgeInsets.all(20),
          child:Column(
            children: [
             Image.network(campaignPhoto,
             fit: BoxFit.cover,
             ),
              SizedBox(height: 20,),
              Text(campaingTitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline5,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
             Text(
                campaignDiscrepcion,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              SizedBox(height: 15,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.share,
                            color: Colors.green,
                          )
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );;
  }
}
