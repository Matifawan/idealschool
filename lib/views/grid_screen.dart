import 'package:flutter/material.dart';
import 'package:idealschool/screens/quiz1234/activity_latest.dart';
import 'package:idealschool/screens/quiz1234/quizez.dart';
import 'package:idealschool/views/homescreen.dart';
import '../grid_view_screen1.dart';
import 'grid_view.dart';
import 'grid_view_screen5.dart'; // Import your screen widgets

class GridScreen extends StatelessWidget {
  GridScreen({
    super.key,
  });

  final List<List<String>> categories = [
    ['Quizzes', 'Quiz ABC', 'Quiz 123', 'Quiz English'],
    ['Kids Tables', 'Activities', 'Subjects for Kids'],
  ];

  // List of screen widgets corresponding to each category item
  final List<Widget> cardScreens = [
    const GridViewScreen(), // Replace with actual screen widgets
    const GridViewScreen1(), // Replace with actual screen widgets
    // Add more screen widgets as needed
    const GridViewScreen5(), // Replace with actual screen widgets
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text(
          'Search Result Screen...',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                categories[index][0],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: _buildCategoryItems(context, index),
            );
          },
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

  List<Widget> _buildCategoryItems(BuildContext context, int index) {
    return categories[index]
        .sublist(1)
        .map((item) => ListTile(
              title: Text(item),
              onTap: () {
                _navigateToScreen(context, categories[index][0], item);
              },
            ))
        .toList();
  }

  void _navigateToScreen(
      BuildContext context, String mainCategory, String subCategory) {
    switch (mainCategory) {
      case 'Quizzes':
        _navigateToQuizScreen(context, subCategory);
        break;
      case 'Kids Tables':
        _navigateToKidsScreen(context, subCategory);
        break;
      default:
        // Handle other categories if needed
        break;
    }
  }

  void _navigateToQuizScreen(BuildContext context, String quizCategory) {
    switch (quizCategory) {
      case 'Quiz ABC':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const KidsQuizScreen(
              cardImagePaths: '',
              imagePath: '',
            ),
          ),
        );
        break;
      case 'Quiz 123':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const KidsQuizScreen(
              cardImagePaths: '',
              imagePath: '',
            ),
          ),
        );
        break;
      case 'Quiz English':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const KidsQuizScreen(
              cardImagePaths: '',
              imagePath: '',
            ),
          ),
        );
        break;
      default:
        // Handle unknown quiz category
        break;
    }
  }

  void _navigateToKidsScreen(BuildContext context, String kidsCategory) {
    switch (kidsCategory) {
      case 'Activities':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const MultiplicationTablesScreen(), // Replace with appropriate screen widget
          ),
        );
        break;
      case 'Subjects for Kids':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const GridViewScreen5(), // Replace with appropriate screen widget
          ),
        );
        break;
      default:
        // Handle unknown kids category
        break;
    }
  }
}
