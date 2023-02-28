import 'package:flutter/material.dart';

class DecisionItem extends StatelessWidget {
  final String optionText;

  const DecisionItem({super.key, required this.optionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Color.fromARGB(98, 34, 100, 151),
        title: Text(
          optionText,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
