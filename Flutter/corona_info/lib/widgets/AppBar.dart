import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  MyAppBar(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.arrow_back, color: Colors.black87),
      title: Text(title, style: TextStyle(color: Colors.black87)),
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
