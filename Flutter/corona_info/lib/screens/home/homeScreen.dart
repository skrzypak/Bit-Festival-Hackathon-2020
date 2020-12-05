import 'dart:convert';

import 'package:corona_info/screens/closestTestingPoint/closestTestingPoint.dart';
import 'package:corona_info/screens/info/infoScreen.dart';
import 'package:corona_info/screens/news/newsScreen.dart';
import 'package:corona_info/screens/statistics/statisticsScreen.dart';
import 'package:corona_info/screens/symptomsComparison/symptomsComparisonScreenGrid.dart';
import 'package:corona_info/utils/Colors.dart';
import 'package:corona_info/widgets/BottomButton.dart';
import 'package:corona_info/widgets/FontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

class HomeFechData {
  final String id;
  final String province;
  final String date_;
  final String activeNumber;
  final String activeNumberPer10k;
  final String deaths;
  final String deathsWithoutIll;
  final String deathsWithIll;

  HomeFechData(
      this.id,
      this.province,
      this.date_,
      this.activeNumber,
      this.activeNumberPer10k,
      this.deaths,
      this.deathsWithoutIll,
      this.deathsWithIll) {}

 
  HomeFechData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        province = json['province'],
        date_ = json['date_'],
        activeNumber = json['activeNumber'],
        activeNumberPer10k = json['activeNumberPer10k'],
        deaths = json['deaths'],
        deathsWithoutIll = json['deathsWithoutIll'],
        deathsWithIll = json['deathsWithIll'];
}

class HomeScreen extends StatefulWidget {
  
    HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 
  double statsColumnSpacing = 15;
  List<String> menuOptions = [
    "Statystyki",
    "Informacje o Covid 19",
    "Porównanie symptomów",
    "Pacjent GOV",
    "Aktualności"
  ];

  _launchURL() async {
    const url = 'https://pacjent.gov.pl';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: MainScreenStats(statsColumnSpacing: statsColumnSpacing),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                child: Text(
                  "Ostatnia aktualizacja: 04.12.2020 10:30",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
              GestureDetector(
                child: HomeScreenOptionTab("Statystyki", "pie-chart"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return StatisticsScreen();
                    }),
                  );
                },
              ),
              GestureDetector(
                child:
                    HomeScreenOptionTab("Informacje o Covid-19", "information"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return InformationsScreen();
                    }),
                  );
                },
              ),
              GestureDetector(
                child: HomeScreenOptionTab("Porównanie symptomów", "checklist"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SymptomsComparisonGrid();
                    }),
                  );
                },
              ),
              GestureDetector(
                child: HomeScreenOptionTab("Pacjent GOV", "mask"),
                onTap: () {
                  _launchURL();
                },
              ),
              GestureDetector(
                child: HomeScreenOptionTab("Aktualności", "newspaper"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return NewsScreen();
                    }),
                  );
                },
              ),
              GestureDetector(
                child: HomeScreenOptionTab(
                    "Najbliższy punkt poboru próbek", "seo"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ClosestTestingPoint();
                    }),
                  );
                },
              ),
              Expanded(
                child: Container(),
              ),
              BottomButton(
                  title: "AKTUALNE ZASADY I OGRANICZENIA",
                  url: "www.google.com"),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenOptionTab extends StatelessWidget {
  HomeScreenOptionTab(this.option, this.image);

  String image;
  String option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(37, 30, 0, 0),
      child: Container(
          child: Row(
        children: [
          SvgPicture.asset(
            "assets/" + image + ".svg",
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(27, 0, 0, 0),
            child: Text(
              option,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class MainScreenStats extends StatelessWidget {
  const MainScreenStats({
    Key key,
    @required this.statsColumnSpacing,
  }) : super(key: key);

  final double statsColumnSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Statystyki z ostatniego dnia",
              style: TextStyle(
                wordSpacing: 5,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: StatsIconColumn(statsColumnSpacing),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                    child: StatsTextColumn(statsColumnSpacing),
                  ),
                  StatsNumberColumn(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatsIconColumn extends StatelessWidget {
  double columnSpacing;
  StatsIconColumn(this.columnSpacing);
  final Widget svgMedicine = SvgPicture.asset("assets/medicine.svg");

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(
        "assets/virus.svg",
        height: 22,
      ),
      SizedBox(height: columnSpacing),
      SvgPicture.asset(
        "assets/healthy.svg",
        height: 22,
      ),
      SizedBox(height: columnSpacing),
      SvgPicture.asset(
        "assets/death.svg",
        height: 22,
      ),
      SizedBox(height: columnSpacing),
      SvgPicture.asset(
        "assets/patient.svg",
        height: 22,
      ),
    ]);
  }
}

class StatsTextColumn extends StatelessWidget {
  double columnSpacing;
  StatsTextColumn(this.columnSpacing);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Wykryto",
          style: TextStyle(
            color: CoronaColor().primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: columnSpacing),
        Text(
          "Ozdrowieni",
          style: TextStyle(
            color: CoronaColor().primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: columnSpacing),
        Text(
          "Zgony",
          style: TextStyle(
            color: CoronaColor().primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: columnSpacing),
        Text(
          "Aktywne",
          style: TextStyle(
            color: CoronaColor().primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class StatsNumberColumn extends StatefulWidget {

  double columnSpacing=15;
  StatsNumberColumn();

  @override
  _StatsNumberColumnState createState() => _StatsNumberColumnState();
}

class _StatsNumberColumnState extends State<StatsNumberColumn> {
  SocketIO socketIO;

  List<String> messages;

  String day;

  int active;

  int death;

  int i = 0;

  @override
    void initState() {
      active = 0;
      death = 0;
    super.initState();
    initStats();
  }

  Future<http.Response> fetchAlbum() {
    return http.get('http://89.74.231.9:8080');
  }

  Future<void> initStats() async {
    var url = 'http://89.74.231.9:8080'; //
    var response = await http.get(url + '/countryDaily?'); //
    //print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      List<dynamic> values = new List<dynamic>();
      List<Map<String, dynamic>> _homeFechData =
          new List<Map<String, dynamic>>();
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];

            print(map);

            map.values.forEach((element) {
              if (i == 2) day = element;
              if (i == 3) active = element;
              if (i == 5) death = element;
              i++;
            });

            setState((){});

            print(day);
            print(active);
            print(death);

          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(
        active.toString(),
        style: TextStyle(
          color: CoronaColor().accent,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      SizedBox(height: widget.columnSpacing),
      Text(
        "-",
        style: TextStyle(
          color: CoronaColor().accent,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      SizedBox(height: widget.columnSpacing),
      Text(
        death.toString(),
        style: TextStyle(
          color: CoronaColor().accent,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      SizedBox(height: widget.columnSpacing),
      Text(
        "-",
        style: TextStyle(
          color: CoronaColor().accent,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ]);
  }
}
