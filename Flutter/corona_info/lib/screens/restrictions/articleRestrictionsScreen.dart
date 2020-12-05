import 'package:corona_info/main.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:corona_info/widgets/BottomButton.dart';
import 'package:corona_info/widgets/FontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleRestrictionsScreen extends StatelessWidget {
  ArticleRestrictionsScreen(this.title);

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: Expanded(
        child: Column(
          children: <Widget>[
            Container(
              child: MyAppBar(title),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: Text(
                  "1,5 METRA – MINIMALNA ODLEGŁOŚĆ MIĘDZY PIESZYMI",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                  "Obowiązek utrzymania co najmniej 1,5-metrowej odległości między pieszymi.\nWyłączeni z tego obowiązku są:\n* rodzice z dziećmi wymagającymi opieki (do 13. roku   życia),\n*osoby wspólnie mieszkające lub gospodarujące,\n*osoby niepełnosprawne, niemogące się samodzielnie poruszać, osoby z orzeczeniem o potrzebie kształcenia specjalnego i ich opiekunowie."),
            ),
            Expanded(child: Container()),
            BottomButton(
                title: "WWW.WHO.INT",
                url: "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub"),
          ],
        ),
      )),
    ));
  }
}
