import 'package:corona_info/utils/Colors.dart';
import 'package:corona_info/widgets/BottomButton.dart';
import 'package:corona_info/widgets/FontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();
  //HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double statsColumnSpacing = 15;
  List<String> menuOptions = ["Statystyki", "Informacje o Covid 19", "Porównanie symptomów", "Pacjent GOV", "Aktualności"];


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
              HomeScreenOptionTab("Statystyki", "pie-chart"),
              HomeScreenOptionTab("Informacje o Covid-19", "information"),
              HomeScreenOptionTab("Porównanie symptomów", "checklist"),
              HomeScreenOptionTab("Pacjent GOV", "mask"),
              HomeScreenOptionTab("Aktualności", "newspaper"),
              HomeScreenOptionTab("Najbliższy punkt poboru próbek", "seo"),
              Expanded(
                child: Container(),
              ),
              BottomButton("AKTUALNE ZASADY I OGRANICZENIA"),
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
          SvgPicture.asset("assets/" + image +".svg",
          height: 32,),
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
                  StatsNumberColumn(statsColumnSpacing),
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
      SvgPicture.asset("assets/virus.svg",
      height: 22,),
      SizedBox(height: columnSpacing),
      SvgPicture.asset("assets/healthy.svg",
      height: 22,),
      SizedBox(height: columnSpacing),
      SvgPicture.asset("assets/death.svg",
      height: 22,),
      SizedBox(height: columnSpacing),
      SvgPicture.asset("assets/patient.svg",
      height: 22,),
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

class StatsNumberColumn extends StatelessWidget {
  double columnSpacing;
  StatsNumberColumn(this.columnSpacing);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(
        "123 534",
        style: TextStyle(
          color: CoronaColor().accent,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      SizedBox(height: columnSpacing),
      Text(
        "12 334",
        style: TextStyle(
          color: CoronaColor().accent,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      SizedBox(height: columnSpacing),
      Text(
        "1234",
        style: TextStyle(
          color: CoronaColor().accent,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      SizedBox(height: columnSpacing),
      Text(
        "123",
        style: TextStyle(
          color: CoronaColor().accent,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ]);
  }
}
