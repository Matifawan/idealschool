import 'package:flutter/material.dart';
import 'package:idealschool/views/homescreen.dart';

class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComingSoonScreenState createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  int points = 0;

  void _incrementPoints() {
    setState(() {
      points += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Lesson'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Video element (placeholder)
            Container(
              color: Colors.grey[300],
              height: 200,
              child: const Center(
                child: Text('Video Player Placeholder'),
              ),
            ),
            const SizedBox(height: 16),
            // Animation element (placeholder)
            Container(
              color: Colors.grey[300],
              height: 150,
              child: const Center(
                child: Text('Animation Placeholder'),
              ),
            ),
            const SizedBox(height: 16),
            // Interactive simulation (example with a simple button interaction)
            ElevatedButton(
              onPressed: _incrementPoints,
              child: const Text('Complete Task to Earn Points'),
            ),
            const SizedBox(height: 16),
            // Display points and badges
            Text(
              'Points: $points',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            if (points >= 50)
              const Text(
                'Badge Earned: Novice Learner',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
          ],
        ),
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
