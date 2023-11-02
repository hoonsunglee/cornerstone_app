import 'package:flutter/material.dart';

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
          widget.onSelected(index);
        },
      ),
    );
  }
}
