import 'package:flutter/material.dart';
import 'package:idealschool/Auth/loginscreen.dart';
import 'package:idealschool/model/unb_model.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key, this.controller});

  final HomeController? controller;

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class HomeController {
  HomeController(firebaseService);
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.6,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Center(
                      child: Image.asset(
                        contents[i].image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 20,
                  right: 2,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen(
                                    controller: null,
                                  )));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 4, 4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 11.0), // Horizontal padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Positioned(
                  top: 1,
                  left: 3,
                  child: Image.asset(
                    'assets/images/playstore.png', // Replace with your logo asset
                    height: 40, // Adjust height to fit with text
                  ),
                ),
                Text(
                  contents[currentIndex].title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 28, // Font size for better visibility
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 1), // Space between title and description
          // Description section
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0), // Horizontal padding
            child: Text(
              contents[currentIndex].description,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Ensure the description is centered
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => buildDots(index, context),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(screenWidth * 0.1),
                    height: screenHeight * 0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        if (currentIndex == contents.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginScreen(
                                controller: TextEditingController(),
                              ),
                            ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn,
                          );
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        side: const BorderSide(
                          width: 2.0,
                          color: Colors.white,
                        ),
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                      ),
                      child: Text(
                        currentIndex == contents.length - 1
                            ? "Continue"
                            : "Next",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      height: 10,
      // dots ki length
      width: index == currentIndex ? 70 : 9,
      //
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index
              ? Colors.green
              : const Color.fromARGB(255, 83, 0, 109)),
    );
  }
}
