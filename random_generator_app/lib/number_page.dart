import 'package:flutter/material.dart';
import 'dart:math';
import './menu_bar.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  String randomNumber = 'X';
  TextEditingController minValue = TextEditingController();
  TextEditingController maxValue = TextEditingController();
  String minValueInput = '', maxValueInput = '';
  int minValueInputInt = 0, maxValueInputInt = 0, randomInRange = 0;

  //Colours
  Color midnightColour = const Color.fromARGB(100, 76, 99, 109);
  Color mintGreenColour = const Color.fromARGB(255, 199, 218, 201);
  Color oceanBlueColour = const Color.fromARGB(255, 146, 187, 203);
  Color burntOrangeColour = const Color.fromARGB(255, 234, 129, 49);
  Color blushColour = const Color.fromARGB(255, 226, 218, 215);
  Color lilacColour = const Color.fromARGB(255, 214, 184, 218);

  void refreshPage() {
    setState(() {
      minValue.clear();
      maxValue.clear();
      randomNumber = 'X';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: const Text('Random Generator'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: refreshPage,
            icon: const Icon(Icons.refresh),
          )
        ],
        backgroundColor: oceanBlueColour,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            randomNumber,
            style: const TextStyle(fontSize: 50),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: minValue,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'min',
                suffixIcon: IconButton(
                  onPressed: () {
                    minValue.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: maxValue,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'max',
                suffixIcon: IconButton(
                  onPressed: () {
                    maxValue.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
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
                      minValueInput = minValue.text.toString();
                      maxValueInput = maxValue.text.toString();

                      minValueInputInt = int.parse(minValueInput);
                      maxValueInputInt = int.parse(maxValueInput);

                      randomInRange = minValueInputInt +
                          Random().nextInt(
                              (maxValueInputInt + 1) - minValueInputInt);

                      randomNumber = randomInRange.toString();
                      FocusScope.of(context).unfocus();
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
