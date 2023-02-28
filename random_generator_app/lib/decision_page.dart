import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:random_generator_app/add_option_button.dart';
import 'package:random_generator_app/dialog_box.dart';
import './decision_item.dart';

class DecisionPage extends StatefulWidget {
  const DecisionPage({super.key});

  @override
  State<DecisionPage> createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  TextEditingController decisionInput = TextEditingController();
  String decisionTxt = 'Your decision is ...';

  void saveNewOption() {
    setState(() {
      decisionTxt = decisionInput.text;
      decisionInput.clear();
    });
  }

  void clearAll() {
    setState(() {
      decisionTxt = 'Your decision is ...';
      decisionInput.clear();
    });
  }

  List optionsList = [
    ["Pizza"],
    ["Chinese"],
  ];

  //create new option
  void createNewOption() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
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
                );
              },
            ),
          )

          // // List of inputted decisions
          // DecisionItem(optionText: 'pizza'),
          // DecisionItem(optionText: 'chinese'),
          // DecisionItem(optionText: 'indian'),
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


//previous buttons
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         setState(
          //           () {
          //             decisionTxt = decisionInput.text;
          //             decisionInput.clear();
          //           },
          //         );
          //       },
          //       child: const Text('Make decision'),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         setState(
          //           () {},
          //         );
          //       },
          //       child: const Text('Clear all'),
          //     ),
          //   ],

// previous textfield to enter decision
// Container(
//   margin: const EdgeInsets.all(5),
//   padding: const EdgeInsets.all(5),
//   child: TextField(
//     controller: decisionInput,
//     decoration: InputDecoration(
//       border: const OutlineInputBorder(),
//       labelText: 'Enter a decision',
//       suffixIcon: IconButton(
//         onPressed: () {
//           decisionInput.clear();
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ),
//   ),
// ),

// previous row of buttons
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     AddOptionButton(
//       text: "Add",
//       onPressed: saveNewOption,
//     ),
//     AddOptionButton(
//       text: "Clear all",
//       onPressed: clearAll,
//     )
//   ],
// ),