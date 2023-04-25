import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:random_generator_app/dialog_box.dart';
import './decision_item.dart';

class DecisionPage extends StatefulWidget {
  const DecisionPage({super.key});

  @override
  State<DecisionPage> createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget dText = const Text(
    '...',
    style: TextStyle(
      fontSize: 35,
      color: Color.fromARGB(255, 76, 99, 109),
    ),
  );
  // String decisionTxt = "...";

  final _controller = TextEditingController();
  TextEditingController questionText = TextEditingController();
  var titleText = TextEditingController(text: 'Decision Generator');
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
    setState(
      () {
        String s = dText.toString();
        var l = optionsList.length;
        int randomNumber = r.nextInt(l);
        s = optionsList[randomNumber][0];
        FocusScope.of(context).unfocus();
        dText = formatText(s);
        animateText();
      },
    );
  }

  //method to refresh the page with default/original values
  void refreshPage() {
    setState(
      () {
        dText = formatText('...');
        questionText.clear();
        optionsList.clear();
        FocusScope.of(context).unfocus();
        titleText.text = 'Random Generator';
      },
    );
  }

  Widget formatText(String s) {
    return dText = Text(
      s,
      style: TextStyle(fontSize: 35, color: midnightColour),
    );
  }

  Widget animateText() {
    return dText = dText
        .animate(
          onPlay: (controller) => controller.loop(count: 3),
          onComplete: (controller) => controller.dispose(),
        )
        .fade(duration: 1000.ms)
        .tint(color: midnightColour)
        .fadeIn(duration: 1000.ms);
  }

  textToString(Text t) {
    var value = t.data;
    return value;
  }

  void moveToTitle(String s) {
    setState(() {
      titleText.text = s;
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            titleText.text,
            style: const TextStyle(
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
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                style: const TextStyle(fontSize: 18),
                controller: questionText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: oceanBlueColour),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: burntOrangeColour),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // errorText: , //change border properties
                  labelText: 'Enter your question',
                  labelStyle: TextStyle(
                      color: midnightColour,
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                  suffixIcon: IconButton(
                    onPressed: () {
                      moveToTitle(questionText.text);
                      questionText.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: midnightColour,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) {
                  moveToTitle(questionText.text);
                  questionText.clear();
                },
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Field cannot be empty.";
                //   }
                // },
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 100, minHeight: 40),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: oceanBlueColour,
                  shadowColor: midnightColour,
                  elevation: 5,
                ),
                label: const Text(
                  'Enter option',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  createNewOption();
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: midnightColour,
                    blurRadius: 5,
                    offset: const Offset(1, 2),
                  )
                ], color: mintGreenColour),
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
                  shadowColor: midnightColour,
                  elevation: 5,
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: burntOrangeColour, width: 2),
                color: Colors.transparent,
              ),
              height: 75,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5),
              child: dText,
            ),
          ],
        ),
      ),
    );
  }
}
