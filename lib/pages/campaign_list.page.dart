import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../model/campaign.dart';
import '../store/campaign_store.dart';


// ignore: must_be_immutable
class CampaignList extends StatefulWidget {
  CampaignStore _store = CampaignStore();
  CampaignList() {
    _store.fetchCampaign();
  }

  @override
  State<CampaignList> createState() => _CampaignListState();
}

class _CampaignListState extends State<CampaignList> {


  @override
  Widget build(BuildContext context) {
    final future = widget._store.campaignListFuture;
    return Observer(
      // ignore: missing_return
      builder: (_) {
        switch (future.status) {
          case FutureStatus.pending:
            return _pendingUsers();

          case FutureStatus.fulfilled:
            final List<Campaign> campaigns = future.result;
            print(campaigns);
            return _loadCampaigns(campaigns,_refresh);

          case FutureStatus.rejected:
            return _failed(_refresh);
            break;
        }
      },
    );
  }

  Future _refresh() => widget._store.fetchCampaign();
}



class _pendingUsers extends StatelessWidget {
  const _pendingUsers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _failed extends StatelessWidget {
  final Future Function() refresh;
  const _failed(this.refresh, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Failed to load items.',
            style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: const Text('Tap to retry'),
            onPressed: refresh,
          )
        ],
      ),
    );
  }
}


class _loadCampaigns extends StatelessWidget {
  final List<Campaign> campaigns;
  final Future Function() refresh;
  const _loadCampaigns(this.campaigns, this.refresh, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:refresh,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: campaigns.length,
        itemBuilder: (context, index) {
          final campaign = campaigns[index];
          return campaignCard(campaign: campaign);
        },
      ),
    );
  }
}

class campaignCard extends StatelessWidget {
  const campaignCard({
    Key key,
    @required this.campaign,
  }) : super(key: key);

  final Campaign campaign;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Card(
        child:DecoratedBox(
          decoration: cardDecoration(),
          child: InkWell(
            onTap: (){
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                       Image.network(campaign.campaignPhoto,
                       fit: BoxFit.cover,),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8),
                child:Container(
                  width: 300,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget> [
                    Text(campaign.campaingTitle, style:Theme.of(context).textTheme.headline6,
                    ),
                    Text(campaign.campaignDiscrepcion, style:Theme.of(context).textTheme.bodyText1 ,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ) ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
          boxShadow:[
            BoxShadow(
              color: Colors.black,
              blurRadius: 2,
              offset: Offset(4, 8), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
             begin: Alignment.centerLeft,
             end: Alignment.centerRight,
             colors: [Colors.amberAccent[100], Colors.lightBlueAccent])
          );

  }
}

