import 'package:corona_info/widgets/AppBar.dart';
import 'package:corona_info/widgets/BottomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClosestTestingPoint extends StatelessWidget {
  String pointName =
      "7 Szpital Marynarki Wojennej z Przychodnią Samodzielny Publiczny Zakład Opieki Zdrowotnej Imienia Kontradmirała Profesora Wiesława Łasińskiego w Gdańsku";
  String address = "ul. Polanki 117, Gdańsk 80-305";
  String hours = "09:00-16:00";
  String telephone = "585526318";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: Expanded(
        child: Column(
          children: <Widget>[
            Container(
              child: MyAppBar("Najbliższy punkt pobrań"),
            ),
            SvgPicture.asset(
              "assets/location-pin.svg",
              height: 270,
            ),
            Text(pointName),
            Text(address),
            Text(hours),
            Text(telephone),
            Expanded(child: Container()),
            BottomButton(title: "PEŁNA LISTA PUNKTÓW"),
          ],
        ),
      )),
    ));
  }
}
