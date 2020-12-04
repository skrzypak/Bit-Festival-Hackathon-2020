import 'package:flutter/material.dart';

class CoronaColor {
  final _primary = '#0476D9';
  final _primaryDark = '#056CF2';
  final _primaryLight = '#C2DCF2';
  final _secondary = '#F24BA7';
  final _accent = '#F2B705';

  Color get primary => fromHex(_primary);
  Color get primaryDark => fromHex(_primaryDark);
  Color get primaryLight => fromHex(_primaryLight);
  Color get secondary => fromHex(_secondary);
  Color get accent => fromHex(_accent);

  static fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}