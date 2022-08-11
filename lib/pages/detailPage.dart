
import 'package:flutter/material.dart';
import 'package:kampanya/const/colors.dart';
import 'package:share_plus/share_plus.dart';
import '../const/LanguageItem.dart';

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

  void _share(){
    String url="https://www.isbank.com.tr/kampanyalar";
    Share.share("${campaingTitle}\n ${campaignDiscrepcion} \n Başka kampanyalar için :${url} ");
  }

}

class _DetailCampaignState extends State<DetailCampaign> {
   Favorite favorite = Favorite();
   @override
   Widget build(BuildContext context) {
     bool love = favorite.youLove(widget.id);
     return Scaffold(
         appBar: AppBar(
           title: Text(LanguageItem.appBarText),
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
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         IconButton(
                             onPressed: () {
                              widget._share();
                             },
                             icon: Icon(
                               Icons.share,
                               color: MyColors().green,
                             )
                         ),

                         IconButton(
                           onPressed: () {
                             setState(() {
                               favorite.favoriteCheck(widget.id, !love);
                             });
                           },
                           icon: Icon(
                               love ? Icons.favorite : Icons.favorite_border),
                           color: MyColors().red,
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


