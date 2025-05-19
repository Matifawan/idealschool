import 'package:flutter/material.dart';
import 'package:idealschool/screens/quiz1234/english_screen.dart';
import 'package:idealschool/screens/quiz_data.dart';
import 'package:idealschool/views/homescreen.dart';

class KidsQuizScreen extends StatelessWidget {
  const KidsQuizScreen({
    super.key,
    required String cardImagePaths,
    required String imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Select Quiz',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 280, // Adjust height as needed
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/m1.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Category',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.swipe,
                      size: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.5,
                children: [
                  QuizSelectionCard(
                    title: 'English Quiz',
                    quizData: englishQuiz,
                    assetPath: 'assets/images/kg-2.png',
                    iconData: Icons.person,
                    labelText: 'English quiz',
                  ),
                  QuizSelectionCard(
                    title: 'Colors Quiz',
                    quizData: colorQuiz,
                    assetPath: 'assets/images/16.png',
                    iconData: Icons.school,
                    labelText: 'Colors Quiz',
                  ),
                  QuizSelectionCard(
                    title: 'Animals Quiz',
                    quizData: colorQuiz,
                    assetPath: 'assets/images/5.png',
                    iconData: Icons.pets,
                    labelText: 'Animals Quiz',
                  ),
                  QuizSelectionCard(
                    title: 'ABC Quiz',
                    quizData: abcQuiz,
                    assetPath: 'assets/images/3.png',
                    iconData: Icons.abc,
                    labelText: 'Abc Quiz',
                  ),
                  QuizSelectionCard(
                    title: '123 Quiz',
                    quizData: numberQuiz,
                    assetPath: 'assets/images/4.png',
                    iconData: Icons.numbers,
                    labelText: 'Numbers Quiz',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizSelectionCard extends StatelessWidget {
  final String title;
  final QuizData quizData;
  final String assetPath;
  final IconData iconData;
  final String labelText;

  const QuizSelectionCard({
    super.key,
    required this.title,
    required this.quizData,
    required this.assetPath,
    required this.iconData,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Quiz(quizData: quizData),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    size: 24,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    labelText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
