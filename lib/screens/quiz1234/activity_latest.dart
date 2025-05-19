import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:idealschool/views/homescreen.dart';

class MultiplicationTablesScreen extends StatelessWidget {
  const MultiplicationTablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.star,
      Icons.favorite,
      Icons.lightbulb,
      Icons.cake,
      Icons.android,
      Icons.access_alarm,
      Icons.airplanemode_active,
      Icons.beach_access,
      Icons.brightness_7,
      Icons.directions_bike,
      Icons.school,
      Icons.emoji_emotions,
      Icons.flash_on,
      Icons.local_cafe,
      Icons.music_note,
      Icons.rocket,
      Icons.sports_soccer,
      Icons.wb_sunny,
      Icons.work,
    ];

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Multiplication Tables'),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Tables Your Choice 2/20',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 19,
                itemBuilder: (context, index) {
                  final tableNumber = index + 2;
                  final randomIcon = icons[Random().nextInt(icons.length)];
                  return InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiplicationTableDetail(
                            tableNumber: tableNumber,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            randomIcon,
                            size: 60,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            'Table of $tableNumber',
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiplicationTableDetail extends StatefulWidget {
  final int tableNumber;

  const MultiplicationTableDetail({super.key, required this.tableNumber});

  @override
  // ignore: library_private_types_in_public_api
  _MultiplicationTableDetailState createState() =>
      _MultiplicationTableDetailState();
}

class _MultiplicationTableDetailState extends State<MultiplicationTableDetail> {
  int currentMultiplier = 1;
  List<int> options = [];
  int selectedOption = -1;
  bool answered = false;

  @override
  void initState() {
    super.initState();
    _generateOptions();
  }

  void _generateOptions() {
    final correctAnswer = widget.tableNumber * currentMultiplier;
    final random = Random();
    options = [correctAnswer];
    while (options.length < 4) {
      int option = (random.nextInt(10) + 1) * widget.tableNumber;
      if (!options.contains(option)) {
        options.add(option);
      }
    }
    options.shuffle();
  }

  void _checkAnswer(int option) {
    final correctAnswer = widget.tableNumber * currentMultiplier;
    bool isCorrect = option == correctAnswer;

    setState(() {
      selectedOption = option;
      answered = true;

      if (isCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Correct!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ));
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            if (currentMultiplier < 10) {
              currentMultiplier++;
              _generateOptions();
              selectedOption = -1;
              answered = false;
            } else {
              _showCompletionDialog();
            }
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Incorrect. Try again!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ));
        answered = false; // Allow the user to try again
      }
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Table Complete'),
          content: const Text('You have completed the table. Restart?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  currentMultiplier = 1;
                  _generateOptions();
                  selectedOption = -1;
                  answered = false;
                });
              },
              child: const Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = '${widget.tableNumber} * $currentMultiplier';
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Table of ${widget.tableNumber}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/14.png', // Replace with your side image asset path
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            Text(
              question,
              style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  bool isSelected = option == selectedOption;
                  bool isCorrect =
                      option == widget.tableNumber * currentMultiplier;
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: isSelected
                        ? (answered && isCorrect ? Colors.green : Colors.red)
                        : Colors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {
                        if (!answered || !isCorrect) _checkAnswer(option);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            option.toString(),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
///////
