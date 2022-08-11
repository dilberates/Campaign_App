import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kampanya/pages/HomePage.dart';
import 'package:kampanya/const/LanguageItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LanguageItem.mainTitle,
      debugShowMaterialGrid: false,
      theme: ThemeData.dark().copyWith(
       appBarTheme: AppBarTheme(
         centerTitle: true,
         systemOverlayStyle: SystemUiOverlayStyle.light,
         backgroundColor: Colors.transparent
       ),
      ),
      home: HomePage(),
    );
  }
}