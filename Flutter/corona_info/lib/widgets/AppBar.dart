import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.arrow_back),
      title: Text('Page title'),
      actions: [
        Icon(Icons.more_vert),
      ],
      backgroundColor: Colors.purple,
    );
  }
}
