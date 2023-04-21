import 'dart:math';

//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:random_generator_app/dialog_box.dart';
import './decision_item.dart';

class DecisionPage extends StatefulWidget {
  const DecisionPage({super.key});

  @override
  State<DecisionPage> createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  String decisionTxt = 'Your decision is ...';
  final _controller = TextEditingController();
  TextEditingController questionText = TextEditingController();
  Random r = Random();

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
        decisionTxt = 'Your decision is ...';
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
        title: const Text('Random Generator'),
        actions: [
          IconButton(
            onPressed: refreshPage,
            icon: const Icon(Icons.refresh),
          )
        ],
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
              ),
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 20),
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
              ),
              child: const Text(
                'Generate',
                style: TextStyle(fontSize: 20),
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
            color: Colors.lightGreen[200],
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
