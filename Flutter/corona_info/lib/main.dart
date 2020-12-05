import 'package:corona_info/screens/closestTestingPoint/ClosestTestingPoint.dart';
import 'package:corona_info/screens/home/homeScreen.dart';
import 'package:corona_info/screens/info/articleInfoScreen.dart';
import 'package:corona_info/screens/info/infoScreen.dart';
import 'package:corona_info/screens/news/newsFilters.dart';
import 'package:corona_info/screens/news/newsScreen.dart';
import 'package:corona_info/screens/statistics/statisticsSearch.dart';
import 'package:corona_info/widgets/BottomButton.dart';
import 'package:flutter/material.dart';

import 'screens/statistics/statisticsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: ArticleInfoScreen(buttonUrl: "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub"),
      home: NewsScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Column(children: <Widget>[
        Text("Hello"),
      ]),
    );
  }
}
