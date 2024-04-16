import 'package:ct484_project/constants.dart';
import 'package:flutter/material.dart';
//import '../constants.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key, required this.result, required this.color});
  final String result;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          result,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: color.red != color.green ? unanswered : Colors.black,
          ),
        )
      ),
    );
  }
}