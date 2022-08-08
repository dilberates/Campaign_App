import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../model/campaign.dart';
import '../store/campaign_store.dart';
import '../components/campaignCard.dart';


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



