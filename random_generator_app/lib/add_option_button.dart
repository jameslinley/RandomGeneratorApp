import 'package:flutter/material.dart';

class AddOptionButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  AddOptionButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
