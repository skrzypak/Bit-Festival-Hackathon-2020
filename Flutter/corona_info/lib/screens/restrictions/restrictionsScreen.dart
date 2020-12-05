import 'package:corona_info/main.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:flutter/material.dart';

class RestrictionScreen extends StatelessWidget {
  RestrictionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Expanded(
          child: Column(
            children: <Widget>[
              Container(child: MyAppBar("Obostrzenia")),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      //color: Colors.red,
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerLeft, child: Text('Ograniczenia')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerRight, child: Text('gov.pl')),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerLeft, child: Text('Kwarantanna')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerRight, child: Text('gov.pl')),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerLeft, child: Text('Życie społeczne')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerRight, child: Text('gov.pl')),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerLeft, child: Text('Opieka i edukacja')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerRight, child: Text('gov.pl')),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerLeft, child: Text('Granice i ruch międzynarodowy')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerRight, child: Text('gov.pl')),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerLeft, child: Text('Gospodarka')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerRight, child: Text('gov.pl')),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerLeft, child: Text('Sport i rekreacja')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerRight, child: Text('gov.pl')),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child:
                            Align(alignment: Alignment.centerLeft, child: Text('Sanatoria, uzdrowiska, rehabilitacja')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                      height: 48,
                      child: Center(
                        child: Align(alignment: Alignment.centerRight, child: Text('gov.pl')),
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
