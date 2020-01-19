import 'package:flutter/material.dart';

class CircleTop extends StatelessWidget {
  final String title;
  final String number;
  CircleTop({this.number, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(number), Text(title)],
        ),
      ),
    );
  }
}
