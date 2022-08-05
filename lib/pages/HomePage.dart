import 'package:flutter/material.dart';
import 'package:kampanya/pages/campaign_list.page.dart';
import 'package:kampanya/pages/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(MyConstans.appBarText),
      ),
      body: CampaignList(),
    );
  }
}