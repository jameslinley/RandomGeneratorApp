import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
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
  Random r = new Random();

  List optionsList = [
    // ["Pizza"],
    // ["Chinese"],
  ];

  void saveNewOption() {
    setState(() {
      optionsList.add([_controller.text]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create new option
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

  //pull to refresh screen method

  //function to remove option at given index
  void deleteOption(int index) {
    setState(() {
      optionsList.removeAt(index);
    });
  }

  void randomDecision() {
    setState(() {
      var l = optionsList.length;
      int randomNumber = r.nextInt(l);
      decisionTxt = optionsList[randomNumber][0];
    });
  }

  void refreshPage() {
    setState(() {
      decisionTxt = 'Your decision is ...';
      optionsList.clear();
    });
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewOption();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(10),
            child: Text(
              decisionTxt,
              style: const TextStyle(fontSize: 35, color: Colors.blueGrey),
            ),
          ),
          //button to generate decision/choose random option from inputted decisions
          ElevatedButton(
            onPressed: () {
              randomDecision();
            },
            child: Text('generate'),
          ),
          const Divider(
            color: Colors.black,
            height: 20,
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
          )
        ],
      ),
    );
  }
}

// animated text code
// child: AnimatedTextKit(
//         animatedTexts: [
//           WavyAnimatedText('COMING SOON',
//               textStyle: const TextStyle(
//                 color: Colors.blueGrey,
//                 fontSize: 30,
//               )),
//         ],
//         repeatForever: true,
//       ),

