
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
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title'
    );
  }

}

class _DetailCampaignState extends State<DetailCampaign> {

  @override
  Widget build(BuildContext context) {
    bool love=youLove(widget.id);
    return Scaffold(
      appBar: AppBar(
        title:Text(MyConstans.appBarText),
      ),
      body:Container(
        padding: const EdgeInsets.all(20),
          child:Column(
            children: [
             Image.network(widget.campaignPhoto,
             fit: BoxFit.cover,
             ),
              Expanded(
                child: Text(widget.campaingTitle,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5,
                  textAlign: TextAlign.center,
                ),
              ),
             Expanded(
               child: Text(
                  widget.campaignDiscrepcion,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,
                ),
             ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                          onPressed: (){
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
                          onPressed:() {
                            setState((){
                             favorite(widget.id, !love) ;
                            });
                          },
                          icon: Icon( love ? Icons.favorite : Icons.favorite_border),
                          color: Colors.red,
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

final fav=[];
void favorite(String id, bool boolLove) {
  if(boolLove) {
    fav.add(id);
  }else{
    fav.remove(id);
  }
}
bool youLove(id) {
  return fav.contains(id);
}