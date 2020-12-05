import 'package:corona_info/main.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:flutter/material.dart';

class StatisticSearch extends StatelessWidget {
  StatisticSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Expanded(
          child: Column(
            children: <Widget>[
              Container(child: MyAppBar("Obostrzenia")),
              Container(child: TextField()),
              singleRow('Polska'),
              singleRow('Powiat1'),
              singleRow('Powiat2'),
              singleRow('Powiat3'),
              singleRow('Powiat4'),
              singleRow('Powiat5'),
              singleRow('Powiat6'),
              singleRow('Powiat7'),
              singleRow('Powiat8'),
            ],
          ),
        ),
      ),
    ));
  }

  Padding singleRow(String data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
          height: 48,
          child: Center(
            child: Align(alignment: Alignment.centerLeft, child: Text(data)),
          ),
        ),
      ),
    );
  }
}
