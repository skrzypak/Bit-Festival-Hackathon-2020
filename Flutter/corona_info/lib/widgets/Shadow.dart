import 'package:flutter/material.dart';

class CoronaShadow {
 static BoxShadow get() {
    return BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.16),
        spreadRadius: 3,
        blurRadius: 6,
        offset: Offset(0, 6)
    );
  }
}