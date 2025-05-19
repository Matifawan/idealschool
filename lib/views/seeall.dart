import 'package:flutter/material.dart';
import 'package:idealschool/views/homescreen.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> announcements = [
      'Admission Open',
      'KG-1',
      'KG- 2',
      'Class 3',
      'Class 4',
      'Class 5',
      'Tuition Fee',
      'Exam Schedule',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anoucements'),
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.announcement),
              title: Text(announcements[index]),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home,
                    size: 28,
                  ),
                  Text('Home'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
