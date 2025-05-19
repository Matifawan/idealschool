import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:idealschool/views/unboarding.dart';
import 'package:idealschool/views/homescreen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IdealSchool',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const Onboarding(), // Start with onboarding screen
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
       
      ],
    );
  }
}
