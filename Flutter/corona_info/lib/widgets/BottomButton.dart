import 'package:corona_info/utils/Colors.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
      child: FlatButton(
          color: CoronaColor().secondary,
          onPressed: () {  },
          child: Text("Button"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}