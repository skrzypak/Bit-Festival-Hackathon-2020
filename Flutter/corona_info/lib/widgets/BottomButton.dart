import 'package:corona_info/utils/Colors.dart';
import 'package:flutter/material.dart';

import 'Shadow.dart';

class BottomButton extends StatelessWidget {
  String title;
  Function() onpressed;
  BottomButton(this.title, this.onpressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [CoronaShadow.get()],
          ),
          height: 48.0,
          child: FlatButton(
            color: CoronaColor().secondary,
            onPressed: onpressed,
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
      ),
    );
  }
}
