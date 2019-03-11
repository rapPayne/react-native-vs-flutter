import 'package:flutter/material.dart';

class Title extends StatelessWidget{
  final String title;
  Title({this.title});
  @override
  Widget build(BuildContext context) {
      return Text(title,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
      );
    }
}
