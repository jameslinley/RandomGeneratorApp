// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:random_generator_app/my_button.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  //colours
  Color midnightColour = const Color.fromARGB(255, 76, 99, 109);
  Color mintGreenColour = const Color.fromARGB(255, 199, 218, 201);
  Color oceanBlueColour = const Color.fromARGB(255, 146, 187, 203);
  Color burntOrangeColour = const Color.fromARGB(255, 234, 129, 49);
  Color blushColour = const Color.fromARGB(255, 226, 218, 215);
  Color lilacColour = const Color.fromARGB(255, 214, 184, 218);

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: blushColour,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              autofocus: true,
              controller: controller,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: 'Add option',
                hintStyle:
                    const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                // labelText: "Add option",

                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: Icon(Icons.clear, color: midnightColour),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(text: "Add", onPressed: onSave),
                const SizedBox(
                  width: 10,
                ),
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
