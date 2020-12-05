import 'package:corona_info/widgets/AppBar.dart';
import 'package:corona_info/widgets/BottomButton.dart';
import 'package:flutter/material.dart';

class ArticleInfoScreen extends StatelessWidget {
  ArticleInfoScreen({this.title="", this.icon="", this.buttonUrl=""});

  final String title;
  final String icon;
  final String buttonUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: Expanded(
        child: Column(
          children: <Widget>[
            Container(
              child: MyAppBar(title, icon: icon),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                  "COVID-19 to choroba wywoływana przez nowego koronawirusa o nazwie SARS-CoV-2. WHO po raz pierwszy dowiedziała się o tym nowym wirusie 31 grudnia 2019 r. Po doniesieniu o grupie przypadków „wirusowego zapalenia płuc” w Wuhan w Chińskiej Republice Ludowej."),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Przetłumaczone przez Google Tłumacz",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            BottomButton(title: title, url: buttonUrl),
          ],
        ),
      )),
    ));
  }
}
