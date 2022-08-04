import 'package:mobx/mobx.dart';
import '../model/campaign.dart';
import '../Service/network_service.dart';

part 'campaign_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<Campaign>> userListFuture;

  @action
  Future fetchUsers(){
    userListFuture = ObservableFuture(httpClient
        .getData("ccccccc")
        .then((users) => users));
  }
}