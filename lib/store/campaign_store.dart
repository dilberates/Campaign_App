import 'package:kampanya/Service/network_service.dart';
import 'package:kampanya/model/campaign.dart';
import 'package:mobx/mobx.dart';

part 'campaign_store.g.dart';

class CampaignStore=_CampaignStore with _$CampaignStore;
abstract class _CampaignStore with Store{
  final NetworkService httpClient=NetworkService();
  
  @observable
  ObservableFuture<List<Campaign>> campaignListFuture;
  
  @action
  Future fetchCampaign()  {
    campaignListFuture=  ObservableFuture(httpClient.getData("https://gist.githubusercontent.com/dilberkilic/7bab6b3c8dd7911ed21be92b7ed44004/raw/5a5f0f38cc2c43c64fa60e4a16b135db9c09630b/campaign.json").then((campaign) => campaign));
  }
  
}