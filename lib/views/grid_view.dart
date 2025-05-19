import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idealschool/views/homescreen.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
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
                    iconSize: 60,
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
                    iconSize: 60,
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
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F1.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'A for Alligator\n\nA سے مگرمچھ\n\nمگرمچھ ایک بڑا رینگنے والا جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F2.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'B for Bear\n\nB سے ریچھ\n\nریچھ ایک بڑا اور طاقتور جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F3.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'C for Cat\n\nC سے بلی\n\nبلی ایک پالتو جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F4.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'D for Dog\n\nD سے کتا\n\nکتا ایک وفادار اور پالتو جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F5.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'E for Elephant\n\nE سے ہاتھی\n\nہاتھی ایک بڑا اور مضبوط جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F6.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'F for Fish\n\nF سے مچھلی\n\nمچھلی ایک آبی جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F7.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'G for Giraffe\n\nG سے زرافہ\n\nزرافہ ایک لمبی گردن والا جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F8.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'H for Horse\n\nH سے گھوڑا\n\nگھوڑا ایک تیز رفتار جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F9.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'I for Iguana\n\nI سے اگوانا\n\nاگوانا ایک بڑی چھپکلی ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F10.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'J for Jaguar\n\nJ سے جاگوار\n\nجاگوار ایک طاقتور جنگلی بلی ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F11.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'K for Kangaroo\n\nK سے کینگرو\n\nکینگرو ایک اچھلنے والا جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F12.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'L for Lion\n\nL سے شیر\n\nشیر جنگل کا بادشاہ ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F13.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'M for Monkey\n\nM سے بندر\n\nبندر ایک شرارتی جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F14.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'N for Narwhal\n\nN سے ناروال\n\nناروال ایک سمندری جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F15.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'O for Owl\n\nO سے الو\n\nالو رات کو جاگنے والا پرندہ ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F16.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'P for Penguin\n\nP سے پینگوئن\n\nپینگوئن ایک سرد علاقوں کا پرندہ ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F17.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'Q for Quail\n\nQ سے بٹیر\n\nبٹیر ایک چھوٹا پرندہ ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F18.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'R for Rabbit\n\nR سے خرگوش\n\nخرگوش ایک تیز دوڑنے والا جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F19.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'S for Snake\n\nS سے سانپ\n\nسانپ ایک رینگنے والا جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F20.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'T for Tiger\n\nT سے شیر\n\nشیر ایک بڑا جنگلی بلی ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F21.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'U for Umbrellabird\n\nU سے امبریلا برڈ\n\nامبریلا برڈ ایک نایاب پرندہ ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F22.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'V for Vulture\n\nV سے گدھ\n\nگدھ ایک بڑا پرندہ ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F23.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'W for Whale\n\nW سے وہیل\n\nوہیل ایک بڑا سمندری جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F24.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'X for X-ray Fish\n\nX سے ایکس رے مچھلی\n\nایکس رے مچھلی ایک چھوٹی مچھلی ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F25.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'Y for Yak\n\nY سے یاک\n\nیاک ایک بڑا اور مضبوط جانور ہے',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/abcd%2F26.png?alt=media&token=6a5fd8c8-9c5c-46d4-ae26-bd45120f9663',
    'Z for Zebra\n\nZ سے زیبرا\n\nزیبرا ایک دھاری دار جانور ہے',
  ),
];
