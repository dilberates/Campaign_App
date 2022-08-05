// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CampaignStore on _CampaignStore, Store {
   final _$campaignListFutureAtom =
      Atom(name: '_CampaignStore.campaignListFuture',);

  @override
  ObservableFuture<List<Campaign>> get campaignListFuture {
    _$campaignListFutureAtom.reportRead();
    return super.campaignListFuture;
  }

  @override
  set campaignListFuture(ObservableFuture<List<Campaign>> value) {
    _$campaignListFutureAtom.reportWrite(value, super.campaignListFuture, () {
      super.campaignListFuture = value;
    });
  }

   final _$_CampaignStoreActionController =
      ActionController(name: '_CampaignStore', );

  @override
  Future<dynamic> fetchCampaign() {
    final _$actionInfo = _$_CampaignStoreActionController.startAction(
        name: '_CampaignStore.fetchCampaign');
    try {
      return super.fetchCampaign();
    } finally {
      _$_CampaignStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
campaignListFuture: ${campaignListFuture}
    ''';
  }
}
