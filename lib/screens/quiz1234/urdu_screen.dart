import 'package:flutter/material.dart';

class UrduScreen extends StatelessWidget {
  const UrduScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English'),
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('English Lesson 1')),
          ListTile(title: Text('English Lesson 2')),
          // Add more list items here
        ],
      ),
    );
  }
}
