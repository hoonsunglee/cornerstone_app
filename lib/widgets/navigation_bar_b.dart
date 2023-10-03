import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNav(
      {required this.selectedIndex, required this.onTabChange, Key? key})
      : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  List<GButton> tabs = [];
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600]!,
    Colors.teal
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 30),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.20),
                offset: const Offset(0, 15),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
              gap: 8,
              color: Colors.grey[800],
              activeColor: Colors.purple,
              iconSize: 24,
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              duration: const Duration(milliseconds: 200),
              tabs: const [
                GButton(
                  haptic: true,
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  haptic: true,
                  icon: Icons.record_voice_over_rounded,
                  text: 'EOP',
                ),
                GButton(
                  haptic: true,
                  icon: Icons.school_rounded,
                  text: 'School',
                ),
                GButton(
                  haptic: true,
                  icon: Icons.account_circle_rounded,
                  text: 'Profile',
                )
              ],
              selectedIndex: widget.selectedIndex,
              onTabChange: (index) {
                widget.onTabChange(index); // Notify the parent
              },
            ),
          ),
        ),
      ),
    );
  }
}
