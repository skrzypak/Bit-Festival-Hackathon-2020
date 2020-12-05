import 'package:corona_info/main.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:corona_info/widgets/FontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformationsScreen extends StatelessWidget {
  InformationsScreen({Key key}) : super(key: key);

  List<List<String>> infoTabs = [
    ["Covid-19", "who.org", "virus"],
    ["Objawy", "who.org", "cough"],
    ["Skutki", "who.org", "hospitalisation"],
    ["Testy", "gov.pl", "testing"],
    ["Leczenie", "gov.pl", "medicine"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Expanded(
          child: Column(
            children: <Widget>[
              Container(child: MyAppBar("Informacje o Covid-19")),
              Image(image: AssetImage("assets/how_to_wear_mask.jpg")),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: infoTabs
                      .map((tab) => new InfoTab(tab[0], tab[1], tab[2]))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class InfoTab extends StatelessWidget {
  InfoTab(this.title, this.source, this.icon);

  String icon;
  String title;
  String source;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            //color: Colors.red,
            height: 48,
            child: Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/" + icon + ".svg",
                      height: 36,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: CoronaFontStyle.robotoMedium16(title),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            height: 48,
            child: Center(
              child:
                  Align(alignment: Alignment.centerRight, child: CoronaFontStyle.robotoRegular12(source)),
            ),
          ),
        )
      ]),
    );
  }
}
