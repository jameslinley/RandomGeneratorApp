import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_generator_app/dialog_box.dart';
import './decision_item.dart';

class DecisionPage extends StatefulWidget {
  const DecisionPage({super.key});

  @override
  State<DecisionPage> createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  String decisionTxt = '...';
  final _controller = TextEditingController();
  TextEditingController questionText = TextEditingController();
  Random r = Random();
  Color midnightColour = const Color.fromARGB(255, 76, 99, 109);
  Color mintGreenColour = const Color.fromARGB(255, 199, 218, 201);
  Color oceanBlueColour = const Color.fromARGB(255, 146, 187, 203);
  Color burntOrangeColour = const Color.fromARGB(255, 234, 129, 49);
  Color blushColour = const Color.fromARGB(255, 226, 218, 215);
  Color lilacColour = const Color.fromARGB(255, 214, 184, 218);

  List optionsList = [];

  void saveNewOption() {
    setState(() {
      optionsList.add([_controller.text]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //method to create a new option
  void createNewOption() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewOption,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //function to remove option at given index
  void deleteOption(int index) {
    setState(
      () {
        optionsList.removeAt(index);
      },
    );
  }

  //method to generate an option at random from list of options
  void randomDecision() {
    setState(() {
      var l = optionsList.length;
      int randomNumber = r.nextInt(l);
      decisionTxt = optionsList[randomNumber][0];
      FocusScope.of(context).unfocus();
    });
  }

  //method to refresh the page with default/original values
  void refreshPage() {
    setState(
      () {
        decisionTxt = '...';
        questionText.clear();
        optionsList.clear();
        FocusScope.of(context).unfocus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Generator',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: refreshPage,
            icon: const Icon(Icons.refresh),
            color: Colors.black,
          )
        ],
        backgroundColor: oceanBlueColour,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.dark_mode),
          color: Colors.black,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: TextField(
              style: const TextStyle(fontSize: 20),
              controller: questionText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your question',
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 100, minHeight: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: oceanBlueColour,
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                createNewOption();
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
            color: Colors.blueGrey,
            height: 5,
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(125, 199, 218, 201),
              child: ListView.builder(
                itemCount: optionsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return DecisionItem(
                    optionText: optionsList[index][0],
                    deleteFunction: (context) => deleteOption(index),
                  );
                },
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.blueGrey,
            height: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 200, minHeight: 40), //width: 200, height: 40
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: oceanBlueColour,
              ),
              child: const Text(
                'Generate',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                randomDecision();
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            color: burntOrangeColour,
            height: 75,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(5), //const EdgeInsets.all(5)
            child: Text(
              decisionTxt,
              style: const TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

//style: const TextStyle(fontSize: 30, color: Colors.black)