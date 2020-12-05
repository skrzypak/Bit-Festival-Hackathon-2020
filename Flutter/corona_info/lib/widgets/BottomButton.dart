import 'package:corona_info/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Shadow.dart';

class BottomButton extends StatelessWidget {
  String title;
  String url;
  BottomButton({this.title, this.url=""});

   _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
            onPressed: () {
              if(url.isNotEmpty)
              _launchURL();},
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
