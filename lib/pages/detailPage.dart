
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:kampanya/model/campaign.dart';
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

}

class _DetailCampaignState extends State<DetailCampaign> {
   Favorite favorite = Favorite();
   @override
   Widget build(BuildContext context) {
     String url="https://www.isbank.com.tr/kampanyalar";
     print("${widget.campaingTitle}\n ${widget.campaignDiscrepcion} \n Başka kampanyalar için :${url} ");

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
                    _titleWid(widget: widget),
                   EmptyBox(),
                   Image.network(
                     widget.campaignPhoto,
                     fit: BoxFit.fill,
                   ),
                   EmptyBox(),
                   _descWid(widget: widget),
                   EmptyBox(),
                   Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Expanded(
                           child: IconButton(
                               onPressed: () {
                                 String url="https://www.isbank.com.tr/kampanyalar";
                                 Share.share("${widget.campaingTitle}\n ${widget.campaignDiscrepcion} \n Başka kampanyalar için :${url} ");
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
                                 //createfav(widget.campaingTitle, widget.campaignDiscrepcion, widget.campaignPhoto);
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

class _descWid extends StatelessWidget {
  const _descWid({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailCampaign widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.campaignDiscrepcion,
      style: Theme
          .of(context)
          .textTheme
          .bodyText1,
    );
  }
}

class _titleWid extends StatelessWidget {
  const _titleWid({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailCampaign widget;

  @override
  Widget build(BuildContext context) {
    return Text(widget.campaingTitle,
     style: Theme
         .of(context)
         .textTheme
         .headline5,
     textAlign: TextAlign.center,
                   );
  }
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

Future<Campaign> createfav(String title,String discr,String photo) async {
  final response = await http.post(
    Uri.parse('https://gist.githubusercontent.com/dilberkilic/0e3eef2630b327a81afd5c3234daa8a7/raw/9cd4f6fc9456e2ee9c611b85f4673b3ab2ee1e85/favorite.json'),
    body: jsonEncode(<String, String>{
      "campaingTitle":title,
      "campaignDiscrepcion":discr,
      "campaignPhoto":photo
    }),
  );
  print("fgf");
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Campaign.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create favorite.');
  }

}
