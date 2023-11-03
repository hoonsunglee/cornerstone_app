import 'package:cornerstone_app/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'color_schemes.g.dart';
import 'Screens/home.dart';
import 'Screens/eop.dart';
import 'Screens/profile.dart';
import 'Screens/school.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int screenIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> pages = const [
    HomeScreen(),
    EopScreen(),
    SchoolScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: true,
        ),
        home: SafeArea(
          child: Scaffold(
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: pages, // This line prevents swipe navigation
            ),
            bottomNavigationBar: CustomNavigationBar(
              selectedIndex: screenIndex,
              onSelected: (index) {
                setState(() {
                  screenIndex = index;
                });
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ));
    return materialApp;
  }
}
