import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class DecisionPage extends StatelessWidget {
  const DecisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText('COMING SOON',
            textStyle: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 30,
            )),
      ],
      repeatForever: true,
    ));
  }
}
