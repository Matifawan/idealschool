import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealschool/Auth/loginscreen.dart';
import 'package:idealschool/Auth/services.dart';
import 'package:idealschool/grid_view_screen1.dart';
import 'package:idealschool/screens/quiz1234/activity_latest.dart';
import 'package:idealschool/screens/quiz1234/quizez.dart';
import 'package:idealschool/views/coomingsoon.dart';
import 'package:idealschool/views/grid_view.dart';
import 'package:idealschool/views/grid_screen.dart';
import 'package:idealschool/views/grid_view_screen5.dart';
import 'package:idealschool/views/seeall.dart';
import 'package:idealschool/views/grid_view_screen2.dart';
import 'package:idealschool/views/grid_view_screen3.dart';
import 'package:idealschool/views/school.dart';
import 'package:idealschool/views/unboarding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  final CarouselController _controller = CarouselController();
  final TextEditingController _searchController = TextEditingController();
  final List<String> _suggestions = [];
  final List<List<String>> searchLists = [
    ['Quizzes', 'ABC', '123'],
    ['Quiz ABC', 'Quiz 123', 'Quiz English'],
    ['Kids Tables', 'Activities', 'Subjects for Kids', 'quiz'],
  ];

  final List<String> imgList = [
    'assets/images/w.png',
    'assets/images/1a.png',
    'assets/images/e.png',
    'assets/images/cover-2.png',
    'assets/images/cover-3.png',
    'assets/images/2.png',
    'assets/images/x.png'
  ];

  final List<String> cardImagePaths = [
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/16.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
    'assets/images/11.png',
    'assets/images/12.png',
    'assets/images/13.png',
    'assets/images/14.png',
  ];

  final List<String> categories = [
    'Class KG-1',
    'Class KG-2',
    'Class2',
    'Class3',
    'Class4',
    'Class5',
    'Free Classes',
  ];

  final List<String> categoryImages = [
    'assets/images/kg.png',
    'assets/images/kg-1.png',
    'assets/images/kg-2.png',
    'assets/images/kg-3.png',
    'assets/images/2.png',
    'assets/images/1.png',
    'assets/images/kg.png',
  ];

  final List<Widget> cardScreens = [
    const GridViewScreen(),
    const GridViewScreen1(),
    const GridViewScreen3(),
    const GridViewScreen2(),
    const GridViewScreen2(),
    const GridViewScreen5(),
    const GridViewScreen2(),
    const GridViewScreen2(),
    const GridViewScreen2(),
    const GridViewScreen2(),
    const GridViewScreen2(),
    const GridViewScreen2(),
    const GridViewScreen1(),
  ];

  @override
  void initState() {
    super.initState();
    
  }

  void _updateSuggestions(String query) {
    setState(() {
      _suggestions.clear();
      if (query.isNotEmpty) {
        for (var list in searchLists) {
          for (var item in list) {
            if (item.toLowerCase().contains(query.toLowerCase())) {
              _suggestions.add(item);
            }
          }
        }
        if (_suggestions.isEmpty) {
          _suggestions.add('Search not found');
        }
      }
    });
  }

  void _onSuggestionTap(String suggestion) {
    if (suggestion != 'Search not found') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GridScreen(),
          settings: RouteSettings(arguments: suggestion),
        ),
      );
    }
    setState(() {
      _suggestions.clear();
      _searchController.clear();
    });
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    var homeController = HomeController(AuthService());
    Get.offAll(() => Onboarding(controller: homeController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: const Text(
          'IdealSchool System',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            iconSize: 25,
            icon: const Icon(
              Icons.notification_important,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    heightFactor: 0.5,
                    widthFactor: 0.9,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50)),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 5,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Ideal School Alerts',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Admission opens Now! KG1-to 5',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AnnouncementScreen(),
                                ),
                              );
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('See All'),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Builder(
            builder: (context) {
              return IconButton(
                iconSize: 25,
                icon: const Icon(Icons.grid_view, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return const DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'No user logged in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                }
                User user = snapshot.data!;
                return UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  accountName: Text(
                    user.displayName ?? 'User Name',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(
                    user.email ?? 'user@example.com',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoURL ??
                        'https://www.example.com/user_avatar.png'),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.deepPurple,
              ),
              title: const Text(
                '',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ComingSoonScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.deepPurple,
              ),
              title: const Text(
                '',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ComingSoonScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
                color: Colors.deepPurple,
              ),
              title: const Text(
                '',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ComingSoonScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.quiz,
                color: Colors.deepPurple,
              ),
              title: const Text(
                '',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ComingSoonScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.deepPurple),
              title: const Text(
                'logout',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                var homeController = HomeController(AuthService());
                Get.offAll(() => LoginScreen(controller: homeController));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onChanged: (query) => _updateSuggestions(query),
              ),
              if (_suggestions.isNotEmpty)
                Container(
                  margin: const EdgeInsets.all(18.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7), // Set opacity to 50%
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.search,
                              color: Colors.deepPurple),
                          title: Text(
                            _suggestions[index],
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                          onTap: () => _onSuggestionTap(_suggestions[index]),
                        );
                      },
                    ),
                  ),
                ),

              CarouselSlider(
                items: imgList.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KidsQuizScreen(
                            imagePath: item,
                            cardImagePaths: '',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(item, fit: BoxFit.cover),
                  );
                }).toList(),
           
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),

//

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller,
                    child: Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.deepPurple)
                            .withOpacity(_current == entry.key ? 0.9 : 0.2),
                      ),
                    ),
                  );
                }).toList(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Education Category',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('swipe', style: TextStyle(fontSize: 18)),
                        Icon(
                          Icons.swipe,
                          weight: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardImagePaths.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                          right: 16.0), // Space between cards
                      child: Card(
                        elevation: 3,
                        child: SizedBox(
                          width: 300, // Set the width of the card
                          height: 250, // Set the height of the card
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => cardScreens[index],
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                cardImagePaths[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Our Classes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('swipe',
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepPurple)),
                      Icon(
                        Icons.view_column,
                        weight: 12,
                        color: Colors.deepPurple,
                      ),
                    ],
                  ),
                ],
              ),

              //

              Container(
                height: 300, // Adjusted height to prevent overflow
                width: 400,
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0, // Adjust vertical padding
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              categoryImages[index],
                              fit: BoxFit.cover,
                              height: 200, // Adjusted image height
                            ),
                            const SizedBox(
                              height: 4.0,
                            ), // Adjusted space between image and text
                            Center(
                              child: Text(
                                categories[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
//

              const SizedBox(
                height: 10,
              ),

              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        tileColor: Colors.deepPurple, // Background color
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 15.0),
                        title: const Row(
                          children: [
                            Icon(Icons.school,
                                color: Colors.white), // School icon
                            SizedBox(
                                width: 16), // Spacing between icon and text
                            Text(
                              'Quizes',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ), // Text for School
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const KidsQuizScreen(
                                cardImagePaths: '',
                                imagePath: '',
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        tileColor: Colors.deepPurple, // Background color
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        title: const Row(
                          children: [
                            Icon(Icons.assignment,
                                color: Colors.white), // Results icon
                            SizedBox(
                                width: 16), // Spacing between icon and text
                            Text(
                              'Activity tables kids',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ), // Text for Results
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MultiplicationTablesScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        tileColor: Colors.deepPurple, // Background color
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        title: const Row(
                          children: [
                            Icon(Icons.book,
                                color: Colors.white), // Courses icon
                            SizedBox(
                                width: 16), // Spacing between icon and text
                            Text(
                              'Subject kids',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ), // Text for Courses
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SchoolDashboard(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              //
            ],
          ),
        ),

        //
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exposure_rounded),
            label: 'School Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School Profile',
          ),
        ],
      ),
    );
  }
}
