import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final String icon;
  MyAppBar(this.title, {this.icon = "", Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.arrow_back, color: Colors.black87),
      title: Row(
        children: [
          Text(title, style: TextStyle(color: Colors.black87)),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: SvgPicture.asset(
                        "assets/" + icon + ".svg",
                        height: 22,
                      ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Icon(Icons.search, color: Colors.black87),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
