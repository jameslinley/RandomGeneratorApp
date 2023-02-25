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
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: const Text(
              'Enter range',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'min',
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'max',
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 100, height: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(0.5),
                  ),
                  child: const Text('Randomise'),
                  onPressed: () {
                    setState(() {
                      randomNumber = Random().nextInt(7).toString();
                    });
                  },
                ),
              ),
              ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 100, height: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(0.5),
                  ),
                  child: const Text('Refresh'),
                  onPressed: () {
                    setState(() {
                      //
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            randomNumber,
            style: const TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}
