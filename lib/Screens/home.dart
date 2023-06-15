import 'package:flutter/material.dart';
import 'package:cornerstone_app/sheets.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showtitle ? const MyLargeTitle() : const Text("lol"),
            IconButton(
                onPressed: toggle,
                icon: const Icon(Icons.remove_circle_outline))
          ],
        ),
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
