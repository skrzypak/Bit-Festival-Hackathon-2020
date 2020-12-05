import 'dart:convert';

import 'package:corona_info/main.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:flutter/material.dart';
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
  int id;
  String province;
  String city;
  String date_;
  int activeNumber;
  double activeNumberPer10k;
  int deaths;
  int deathsWithoutIll;
  int deathsWithIll;

  CountiesFechData(
      {this.id,
      this.province,
      this.city,
      this.date_,
      this.activeNumber,
      this.activeNumberPer10k,
      this.deaths,
      this.deathsWithoutIll,
      this.deathsWithIll});

  factory CountiesFechData.fromJson(Map<String, dynamic> json) {
    return CountiesFechData(
        id: json['id'],
        province: json['province'],
        city: json['city'],
        date_: json['date_'],
        activeNumber: json['activeNumber'],
        activeNumberPer10k: json['activeNumberPer10k'],
        deaths: json['deaths'],
        deathsWithoutIll: json['deathsWithoutIll'],
        deathsWithIll: json['deathsWithIll']);
  }

  CountiesFechData getFromJson(Map<String, dynamic> json) {
    CountiesFechData cfd = new CountiesFechData();
    cfd.id = json['id'];
    cfd.province = json['province'];
    cfd.city = json['city'];
    cfd.date_ = json['date_'];
    cfd.activeNumber = json['activeNumber'];
    cfd.activeNumberPer10k = json['activeNumberPer10k'];
    cfd.deaths = json['deaths'];
    cfd.deathsWithIll = json['deathsWithIll'];
    cfd.deathsWithoutIll = json['deathsWithoutIll'];
    return cfd;
  }
}

class StatisticSearch extends StatefulWidget {
  @override
  _StatisticSearchState createState() => _StatisticSearchState();
}

class _StatisticSearchState extends State<StatisticSearch> {
  Future<List<String>> cities;

  StatisticsScreen({Key key}) {
    //initProvinces();
  }

  @override
  void initState() {
    cities = initCounties('lubelskie');
    super.initState();
    print("halo");
    //initCounties('lubelskie');
  }

  // Future<List<String>> initProvinces() async {
  //   List<String> tempString = new List();
  //   var url = 'http://89.74.231.9:8080'; //
  //   var response = await http.get(url + '/provinces?'); //
  //   if (response.statusCode == 200) {
  //     List<dynamic> values = new List<dynamic>();
  //     List<Map<String, dynamic>> _homeFechData =
  //         new List<Map<String, dynamic>>();
  //     values = json.decode(response.body);
  //     if (values.length > 0) {
  //       for (int i = 0; i < values.length; i++) {
  //         if (values[i] != null) {
  //           Map<String, dynamic> map = values[i];

  //           //TODO ... province
  //           //print(map);
  //           ProvinceFechData province = ProvinceFechData.fromJson(map);
  //           // print(province.id);

  //           // ......

  //           // todo lista wojewodztw

  //         }
  //       }
  //     }
  //     return _homeFechData;
  //   }
  // }

  Future<List<String>> initCounties(name) async {
    List<String> tempString = new List();
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
            //print(map);
            // ......
            //print(map["city"]);
            tempString.add(map["city"]);
            // print(cities);
            // Todo lista powaitow

          }
        }
      }
      return tempString.toList();
    }
  }

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
              FutureBuilder<List<String>>(
                future: cities,
                builder: (context, snapshot) {
                  return Expanded(
                                      child: Container(
                      child: ListView(
                        children: [
                          Column(
                              children: snapshot.data
                                  .map((city) => singleRow(city))
                                  .toList()),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          height: 48,
          child: Center(
            child: Align(alignment: Alignment.centerLeft, child: Text(data)),
          ),
        ),
      ),
    );
  }
}
