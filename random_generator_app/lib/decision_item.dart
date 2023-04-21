import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
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
        height: 40,
        margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 1), //EdgeInsets.symmetric(horizontal: 20, vertical: 1),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          tileColor: Colors.transparent,
          title: Text(
            optionText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
