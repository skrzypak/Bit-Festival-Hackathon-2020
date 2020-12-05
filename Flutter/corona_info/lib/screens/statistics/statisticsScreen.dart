import 'dart:convert';

import 'package:corona_info/screens/statistics/localWidgets/mainChart.dart';
import 'package:corona_info/utils/Colors.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:http/http.dart' as http;

class ProvinceFechData {
  final String id;
  final String province;
  final String date_;
  final String activeNumber;
  final String activeNumberPer10k;
  final String deaths;
  final String deathsWithoutIll;
  final String deathsWithIll;

  ProvinceFechData(
      this.id,
      this.province,
      this.date_,
      this.activeNumber,
      this.activeNumberPer10k,
      this.deaths,
      this.deathsWithoutIll,
      this.deathsWithIll) {}

  ProvinceFechData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        province = json['province'],
        date_ = json['date_'],
        activeNumber = json['activeNumber'],
        activeNumberPer10k = json['activeNumberPer10k'],
        deaths = json['deaths'],
        deathsWithoutIll = json['deathsWithoutIll'],
        deathsWithIll = json['deathsWithIll'];
}

class CountiesFechData {
  final String id;
  final String province;
  final String city;
  final String date_;
  final String activeNumber;
  final String activeNumberPer10k;
  final String deaths;
  final String deathsWithoutIll;
  final String deathsWithIll;

  CountiesFechData(
      this.id,
      this.province,
      this.city,
      this.date_,
      this.activeNumber,
      this.activeNumberPer10k,
      this.deaths,
      this.deathsWithoutIll,
      this.deathsWithIll) {}

  CountiesFechData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        province = json['province'],
        city = json['city'],
        date_ = json['date_'],
        activeNumber = json['activeNumber'],
        activeNumberPer10k = json['activeNumberPer10k'],
        deaths = json['deaths'],
        deathsWithoutIll = json['deathsWithoutIll'],
        deathsWithIll = json['deathsWithIll'];
}

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

  StatisticsScreen() {
    //initProvinces();
    initCounties('lubelskie');
  }

  Future<void> initProvinces() async {
    var url = 'http://89.74.231.9:8080'; //
    var response = await http.get(url + '/provinces?'); //
    if (response.statusCode == 200) {
      List<dynamic> values = new List<dynamic>();
      List<Map<String, dynamic>> _homeFechData =
          new List<Map<String, dynamic>>();
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];

            //TODO ... province
            print(map);
            // ......

            // todo lista wojewodztw

          }
        }
      }
      return _homeFechData;
    }
  }

  Future<void> initCounties(name) async {
    var url = 'http://89.74.231.9:8080'; //
    var response = await http.get(url + '/counties/' + name + '?'); //
    if (response.statusCode == 200) {
      List<dynamic> values = new List<dynamic>();
      List<Map<String, dynamic>> _homeFechData =
          new List<Map<String, dynamic>>();
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];

            //TODO ... province counties
            print(map);
            // ......

            // Todo lista powaitow

          }
        }
      }
      return _homeFechData;
    }
  }

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
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40),
                        border:
                            Border.all(color: CoronaColor().primary, width: 3),
                      ),
                      child: ToggleSwitch(
                        activeBgColor: CoronaColor().primary,
                        activeFgColor: Colors.black87,
                        inactiveBgColor: Colors.white,
                        cornerRadius: 200,
                        minWidth: 100,
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
