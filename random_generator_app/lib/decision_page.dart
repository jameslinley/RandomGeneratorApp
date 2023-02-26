import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class DecisionPage extends StatefulWidget {
  const DecisionPage({super.key});

  @override
  State<DecisionPage> createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  TextEditingController decisionInput = TextEditingController();
  String decisionTxt = 'Your decision is ...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(5),
            child: Text(
              decisionTxt,
              style: const TextStyle(fontSize: 30, color: Colors.blueGrey),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: decisionInput,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a decision',
                suffixIcon: IconButton(
                  onPressed: () {
                    decisionInput.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      decisionTxt = decisionInput.text;
                      decisionInput.clear();
                    },
                  );
                },
                child: const Text('Make decision'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {},
                  );
                },
                child: const Text('Clear'),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 20,
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