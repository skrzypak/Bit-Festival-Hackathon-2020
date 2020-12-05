import 'package:corona_info/main.dart';
import 'package:corona_info/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:corona_info/widgets/Shadow.dart';


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


class NewsScreen extends StatelessWidget {
  NewsScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(children: <Widget>[
            MyAppBar('Aktualności'),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [CoronaShadow.get()],
                ),
                child: Column(
                  children: [
                    Container(color: Colors.red, height: 200),
                    Container(
                        height: 150,
                        child: Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Title',
                                        style: TextStyle(
                                            fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black87)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                                child: Container(
                                  child: Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                      style: TextStyle(fontSize: 14, color: Colors.black87)),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      //child: Image.asset('assets/TwitterTest.png', height: 32),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                            child: Image.asset('assets/TwitterTest.png', height: 32),
                                          ),
                                          Text('Twitter.com'),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        )),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [CoronaShadow.get()],
                ),
                child: Container(
                    height: 150,
                    child: Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Title',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black87)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                            child: Container(
                              child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                  style: TextStyle(fontSize: 14, color: Colors.black87)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  //child: Image.asset('assets/TwitterTest.png', height: 32),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                        child: Image.asset('assets/TwitterTest.png', height: 32),
                                      ),
                                      Text('Twitter.com'),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [CoronaShadow.get()],
                ),
                child: Container(
                    height: 150,
                    child: Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Title',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black87)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                            child: Container(
                              child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                  style: TextStyle(fontSize: 14, color: Colors.black87)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  //child: Image.asset('assets/TwitterTest.png', height: 32),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                        child: Image.asset('assets/TwitterTest.png', height: 32),
                                      ),
                                      Text('Twitter.com'),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [CoronaShadow.get()],
                ),
                child: Container(
                    height: 150,
                    child: Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Title',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black87)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                            child: Container(
                              child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                  style: TextStyle(fontSize: 14, color: Colors.black87)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  //child: Image.asset('assets/TwitterTest.png', height: 32),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                        child: Image.asset('assets/TwitterTest.png', height: 32),
                                      ),
                                      Text('Twitter.com'),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
