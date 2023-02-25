import 'package:flutter/material.dart';
import 'dart:math';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  String randomNumber = 'X';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            randomNumber,
            style: const TextStyle(fontSize: 30),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              child: const Text('Randomise'),
              onPressed: () {
                setState(() {
                  randomNumber = Random().nextInt(7).toString();
                });
              },
            ),
          )
        ],
      )),
    );
  }
}
