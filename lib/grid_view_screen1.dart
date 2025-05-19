import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idealschool/views/homescreen.dart';

class GridViewScreen1 extends StatefulWidget {
  const GridViewScreen1({super.key});

  @override
  State<GridViewScreen1> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen1> {
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
      appBar: AppBar(
        title: const Text('ABC'),
        leading: null, // Set leading to null to remove the leading icon
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: imageDataList.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return CachedNetworkImage(
                      placeholder: (context, url) => Image.asset(
                        'assets/images/ono1.gif',
                        fit: BoxFit.contain,
                      ),
                      imageUrl: imageDataList[i].imageUrl,
                      fit: BoxFit.cover, // Use BoxFit.cover to fill the screen
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    );
                  },
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.keyboard_arrow_left_rounded),
                    onPressed: () {
                      if (currentIndex > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.keyboard_arrow_right_rounded),
                    onPressed: () {
                      if (currentIndex < imageDataList.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              children: [
                Text(
                  imageDataList[currentIndex].description,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                    height:
                        16), // Adding space between description and arrow icons
              ],
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

class ImageData {
  final String imageUrl;
  final String description;

  ImageData(this.imageUrl, this.description);
}

List<ImageData> imageDataList = [
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F1.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Number 1\n\n..............\n\n جانور ہے'),
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F2.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Animals\n\n..............\n\n جانور ہے'),
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F3.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Animals\n\n..............\n\n جانور ہے'),
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F4.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Animals\n\n..............\n\n جانور ہے'),
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F5.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Animals\n\n..............\n\n جانور ہے'),
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F6.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Animals\n\n..............\n\n جانور ہے'),
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F7.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Animals\n\n..............\n\n جانور ہے'),
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F8.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Animals\n\n..............\n\n جانور ہے'),
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F9.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Animals\n\n..............\n\n جانور ہے'),
  ImageData(
      'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2Fabc%2F10.png?alt=media&token=64ce4065-4519-4e51-8b2e-b889b6d6e06f',
      'Animals\n\n..............\n\n جانور ہے'),
];
