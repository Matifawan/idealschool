import 'package:flutter/material.dart';
import 'package:idealschool/views/homescreen.dart';

class SchoolDashboard extends StatelessWidget {
  SchoolDashboard({super.key});

  // Define a list of subjects with their icons
  final List<Map<String, dynamic>> subjects = [
    {'name': 'English', 'icon': Icons.language},
    {'name': 'Urdu', 'icon': Icons.language},
    {'name': 'Islamic Studies', 'icon': Icons.mosque},
    {'name': 'Civics', 'icon': Icons.people},
    {'name': 'Pakistan Studies', 'icon': Icons.flag},
    // Add more subjects here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                image: DecorationImage(
                  image: AssetImage('assets/images/bookmar.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 10, // Number of classes
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    elevation: 5,
                    color: Colors.white, // Background color for each card
                    child: Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.class_outlined),
                          ),
                          title: Text('Class ${index + 1}'),
                          // Add subject list for each class
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var subject in subjects)
                                ListTile(
                                  leading: Icon(subject['icon']),
                                  title: Text(subject['name']),
                                ),
                            ],
                          ),
                          onTap: () {
                            // Handle class tap
                          },
                        ),
                        // Add more subjects here if needed
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
