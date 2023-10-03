import 'package:flutter/material.dart';
import 'package:cornerstone_app/src/sheets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showtitle = true;
  void hello() {
    getData();
  }

  void toggle() {
    setState(() {
      getData();
      showtitle = !showtitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Text("Hello Home Screen!");
  }
}
