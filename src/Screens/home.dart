import 'package:flutter/material.dart';
import 'package:cornerstone_app/sheets.dart';
import 'package:cornerstone_app/widgets/navigation_bar_b.dart';
import 'package:gsheets/gsheets.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showtitle = true;

  void toggle() {
    setState(() {
      getData();
      showtitle = !showtitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: 
          Center(
            child: BottomNav(),
            ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "My Large Title",
      style: TextStyle(
          fontSize: 25, color: Theme.of(context).textTheme.titleLarge?.color),
    );
  }
}
