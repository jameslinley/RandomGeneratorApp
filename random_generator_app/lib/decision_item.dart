import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DecisionItem extends StatelessWidget {
  final String optionText;
  Function(BuildContext)? deleteFunction;

  DecisionItem(
      {super.key, required this.optionText, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Color(0xFF4C636D),
          title: Text(
            optionText,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
