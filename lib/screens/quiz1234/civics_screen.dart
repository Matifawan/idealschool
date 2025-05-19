import 'package:flutter/material.dart';

class CivicsScreen extends StatelessWidget {
  const CivicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urdu'),
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('Urdu Lesson 1')),
          ListTile(title: Text('Urdu Lesson 2')),
          // Add more list items here
        ],
      ),
    );
  }
}
