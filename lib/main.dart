import 'package:cornerstone_app/widgets/navigation_bar_b.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'Screens/home.dart';
import 'Screens/eop.dart';
import 'Screens/profile.dart';
import 'Screens/school.dart';
import 'firebase_options.dart';

var lg = Logger();
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
  int selectedIndex = 0;
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
            body: IndexedStack(
              index: selectedIndex,
              children: pages,
            ),
            bottomNavigationBar: const ResponsiveBottomNav(),
          ),
        ));
    return materialApp;
  }
}
