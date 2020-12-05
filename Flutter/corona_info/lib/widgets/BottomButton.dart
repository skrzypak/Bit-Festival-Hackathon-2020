import 'package:corona_info/utils/Colors.dart';
import 'package:flutter/material.dart';

import 'Shadow.dart';

class BottomButton extends StatelessWidget {
  String title;
  BottomButton(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [CoronaShadow.get()],
        ),
        height: 48.0,
        child: FlatButton(
          color: CoronaColor().secondary,
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
        ),
      ),
    );
  }
}
