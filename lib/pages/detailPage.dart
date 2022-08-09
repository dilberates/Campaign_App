
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../constants.dart';

class DetailCampaign extends StatefulWidget {
  final id;
  final String campaingTitle, campaignDiscrepcion, campaignPhoto;
  const DetailCampaign(this.id,
      this.campaingTitle,
      this.campaignDiscrepcion,
      this.campaignPhoto,
      {Key key}) : super(key: key);

  @override
  State<DetailCampaign> createState() => _DetailCampaignState();

  Future<void> share() async {
    await FlutterShare.share(
        title:campaingTitle,
        text: campaignDiscrepcion,
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Paylaş'
    );
  }

}

class _DetailCampaignState extends State<DetailCampaign> {
   Favorite favorite = Favorite();

   @override
   Widget build(BuildContext context) {
     bool love = favorite.youLove(widget.id);
     return Scaffold(
         appBar: AppBar(
           title: Text(MyConstans.appBarText),
         ),
         body: SingleChildScrollView(
           child: Container(
               padding: const EdgeInsets.all(20),
               child: Column(
                 children: [
                    Text(widget.campaingTitle,
                     style: Theme
                         .of(context)
                         .textTheme
                         .headline5,
                     textAlign: TextAlign.center,
                   ),
                   EmptyBox(),
                   Image.network(
                     widget.campaignPhoto,
                     fit: BoxFit.fill,
                   ),
                   EmptyBox(),
                   Text(
                     widget.campaignDiscrepcion,
                     style: Theme
                         .of(context)
                         .textTheme
                         .bodyText1,
                   ),
                   EmptyBox(),
                   Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Expanded(
                           child: IconButton(
                               onPressed: () {
                                 widget.share();
                               },
                               icon: Icon(
                                 Icons.share,
                                 color: Colors.green,
                               )
                           ),
                         ),

                         Expanded(
                           child: IconButton(
                             onPressed: () {
                               setState(() {
                                 favorite.favoriteCheck(widget.id, !love);
                               });
                             },
                             icon: Icon(
                                 love ? Icons.favorite : Icons.favorite_border),
                             color: Colors.red,
                           ),
                         )
                       ],
                     ),
                   ),
                 ],
               )
           ),
         ),
     );
   }

   SizedBox EmptyBox() => SizedBox(height: 30,);
}


class Favorite {
  final fav = [];

  void favoriteCheck(String id, bool boolLove) {
    if (boolLove) {
      fav.add(id);
    } else {
      fav.remove(id);
    }
  }

  bool youLove(id) {
    return fav.contains(id);
  }
}
