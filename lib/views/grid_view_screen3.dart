import 'package:flutter/material.dart';
import 'package:idealschool/views/homescreen.dart';

class GridViewScreen3 extends StatefulWidget {
  const GridViewScreen3({super.key});

  @override
  State<GridViewScreen3> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen3> {
  final PageController _pageController = PageController();
  final List<Map<String, dynamic>> colors = [
    {'color': Colors.red, 'name': 'Red'},
    {'color': Colors.green, 'name': 'Green'},
    {'color': Colors.blue, 'name': 'Blue'},
    {'color': Colors.yellow, 'name': 'Yellow'},
    {'color': Colors.orange, 'name': 'Orange'},
    {'color': Colors.purple, 'name': 'Purple'},
    {'color': Colors.pink, 'name': 'Pink'},
    {'color': Colors.brown, 'name': 'Brown'},
    {'color': Colors.cyan, 'name': 'Cyan'},
    {'color': Colors.lime, 'name': 'Lime'},
    {'color': Colors.indigo, 'name': 'Indigo'},
    {'color': Colors.teal, 'name': 'Teal'},
    {'color': Colors.amber, 'name': 'Amber'},
    {'color': Colors.grey, 'name': 'Grey'},
    {'color': Colors.blueGrey, 'name': 'Blue Grey'},
    {'color': Colors.lightGreen, 'name': 'Light Green'},
    {'color': Colors.lightBlue, 'name': 'Light Blue'},
    {'color': Colors.deepOrange, 'name': 'Deep Orange'},
    {'color': Colors.deepPurple, 'name': 'Deep Purple'},
  ];

  Color _selectedColor = Colors.white;
  String _colorName = 'White';

  void _chooseColor(Color color, String colorName) {
    setState(() {
      _selectedColor = color;
      _colorName = colorName;
    });
  }

  void _nextPage() {
    if (_pageController.page != null) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_pageController.page != null) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedColor,
      appBar: AppBar(
        title: const Text('Color Chooser Swipe'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/ono1.gif',
            height: 300,
            width: 400,
          ),
          const SizedBox(height: 20),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            color: _selectedColor,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Selected Color: $_colorName',
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                final colorMap = colors[index];
                return GestureDetector(
                  onTap: () =>
                      _chooseColor(colorMap['color'], colorMap['name']),
                  child: Container(
                    color: colorMap['color'],
                    child: Center(
                      child: Text(
                        colorMap['name'],
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 40,
                icon: const Icon(Icons.keyboard_arrow_left_rounded),
                onPressed: _previousPage,
              ),
              const SizedBox(width: 170),
              IconButton(
                iconSize: 40,
                icon: const Icon(Icons.keyboard_arrow_right_rounded),
                onPressed: _nextPage,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 28,
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
