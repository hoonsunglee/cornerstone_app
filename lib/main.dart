import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widgets/indexed_stack_animation';
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
  final PageController controller = PageController();
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
            textTheme: TextTheme(
                titleLarge: TextStyle(
          color: Colors.amber[700],
        ))),
        home: SafeArea(
          child: Scaffold(
            body: const AnimatedIndexedStack(),
            bottomNavigationBar: CustomNavigationBar(
              selectedIndex: screenIndex,
              onSelected: (index) {
                setState(() {
                  screenIndex = index;
                });
              },
            ),
          ),
        ));
    return materialApp;
  }
}

class CustomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onSelected;

  const CustomNavigationBar(
      {required this.selectedIndex, required this.onSelected, super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: const NavigationBarThemeData(
          labelTextStyle:
              MaterialStatePropertyAll(TextStyle(letterSpacing: 0.1))),
      child: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.school_rounded), label: 'School'),
          NavigationDestination(
              icon: Icon(Icons.check_box_rounded), label: 'EOP'),
          NavigationDestination(
              icon: Icon(Icons.person_rounded), label: 'Profile')
        ],
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            widget.onSelected(index);
          });
        },
      ),
    );
  }
}
