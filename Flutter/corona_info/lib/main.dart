import 'package:corona_info/screens/home/homeScreen.dart';
import 'package:corona_info/screens/info/articleInfoScreen.dart';
import 'package:corona_info/screens/info/infoScreen.dart';
<<<<<<< HEAD
import 'package:corona_info/screens/restrictions/articleRestrictionsScreen.dart';
=======
import 'package:corona_info/screens/news/newsFilters.dart';
>>>>>>> Karol
import 'package:corona_info/widgets/BottomButton.dart';
import 'package:flutter/material.dart';

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
      home: NewsFilters(),
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
