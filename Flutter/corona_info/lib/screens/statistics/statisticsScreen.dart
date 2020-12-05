import 'dart:convert';

import 'package:corona_info/screens/statistics/localWidgets/mainChart.dart';
import 'package:corona_info/utils/Colors.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:flutter_socket_io/flutter_socket_io.dart';




class StatisticsScreen extends StatelessWidget {
  SocketIO socketIO;
  List<String> messages;
  

  List<List<String>> statsValues = [
    ["Statystyki", "Suma", "Średnia\n(dzienna)"],
    ["Zarażenia", "451 434", "12 534"],
    ["Ozdrowienia", "313 523", "32 123"],
    ["Zgony", "12 432", "634"],
    ["Aktywne", "543 123", "-"]
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Expanded(
            child: SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(child: MyAppBar("Statystyki", temp: true)),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "Polska",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 250,
                        child: SimpleTimeSeriesChart.withSampleData(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
                    child: Column(
                      children: statsValues
                          .map((row) =>
                              new StatisticsSingleRow(row[0], row[1], row[2]))
                          .toList(),
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border:
                            Border.all(color: CoronaColor().primary, width: 3),
                      ),
                      child: ToggleSwitch(
                        activeBgColor: CoronaColor().primary,
                        activeFgColor: Colors.black87,
                        inactiveBgColor: Colors.white,
                        cornerRadius: 200,
                        minWidth: 121.128,
                        initialLabelIndex: 0,
                        labels: ['Tygodniowe', 'Miesięczne', 'Całość'],
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StatisticsSingleRow extends StatelessWidget {
  StatisticsSingleRow(
    this.firstValue,
    this.secondValue,
    this.thirdValue, {
    Key key,
  }) : super(key: key);

  String firstValue;
  String secondValue;
  String thirdValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 17),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 17),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  firstValue,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  secondValue,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  thirdValue,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
