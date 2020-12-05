import 'dart:ffi';

import 'package:corona_info/main.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsFilters extends StatelessWidget {
  NewsFilters({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          MyAppBar("Wybierz interesujące Cię"),
          singleRowInfo('assets/TwitterTest.png'),
          singleRowInfo2("Ministerstwo Zdrowia"),
          singleRowInfo2("Minister zdrowia"),
          singleRowInfo2("Światowa organizacja Zdrowia"),
          singleRowInfo(null),
          singleRowInfo2("Ministerstwo Zdrowia"),
          singleRowInfo2("Minister zdrowia"),
          singleRowInfo2("Światowa organizacja Zdrowia"),
        ],
      ),
    ));
  }

  Padding singleRowInfo(String iconName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(children: <Widget>[
        Expanded(
          flex: 3,
          child: Center(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(Icons.check_box_outline_blank),
                  if (iconName == null)
                    Row(children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: SvgPicture.asset("assets/newspaper.svg", height: 32)),
                      Text('Media informacyjne')
                    ])
                  else
                    Row(children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(iconName, height: 32)),
                      Text('Twitter')
                    ]),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Padding singleRowInfo2(String data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 10, 20, 20),
      child: Row(children: <Widget>[
        Expanded(
          flex: 3,
          child: Center(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(Icons.check_box_outline_blank),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  Text(data),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
