import 'package:corona_info/main.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:corona_info/widgets/Shadow.dart';

class SymptomsComparisonGrid extends StatelessWidget {
  SymptomsComparisonGrid({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: <Widget>[
          MyAppBar('Porównanie symptomów'),
          Container(color: Colors.red, height: 200),
          Container(
              height: 126,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [CoronaShadow.get()],
                  ),
                  child: Center(
                    child: Text(
                      "W przypadku wystąpienia podobnych objawów co przedstawione poniżej prosze skonsultować się telefonicznie z lekarzem",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
          GridView.count(
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 4 / 2,
              crossAxisCount: 4,
              shrinkWrap: true,
              children: List.generate(choices.length, (index) {
                return Center(child: Container(child: TileCard(choice: choices[index])));
              })),
        ]),
      ),
    );
  }
}

class Type {
  const Type({this.title, this.icon});
  final String title;
  final IconData icon;
}

class TileCard extends StatelessWidget {
  const TileCard({Key key, this.choice}) : super(key: key);
  final Type choice;

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black87)),
      ),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          if (choice.icon != null) Icon(choice.icon, size: 24.0),
          if (choice.icon == null) Text(choice.title),
        ]),
      ),
    ));
  }
}

const List<Type> choices = const <Type>[
  const Type(title: 'Symptomy', icon: null),
  const Type(title: 'Grypa', icon: null),
  const Type(title: 'Przeziębienie', icon: null),
  const Type(title: 'Covid', icon: null),
  const Type(title: 'Ból głowy', icon: null),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: 'Temperatura', icon: null),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: 'Nudności', icon: null),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: 'Temp', icon: null),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: 'Temp', icon: null),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: 'Temp', icon: null),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: 'Temp', icon: null),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: 'Temp', icon: null),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
  const Type(title: '', icon: Icons.clear),
];
