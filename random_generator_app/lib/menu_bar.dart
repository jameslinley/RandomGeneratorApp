import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false;
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.sunny),
            title: const Text('Dark mode'),
            onTap: () {},
          ),
          Switch(
            value: isDarkMode,
            onChanged: (bool newBool) {
              isDarkMode = newBool;
            },
          ),
        ],
      ),
    );
  }
}
