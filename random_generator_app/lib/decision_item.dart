import 'package:flutter/material.dart';

class DecisionItem extends StatelessWidget {
  const DecisionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Color.fromARGB(255, 207, 239, 170),
        title: Text(
          'Pizza',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        trailing: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
