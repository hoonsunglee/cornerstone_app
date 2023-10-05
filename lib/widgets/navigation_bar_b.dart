import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResponsiveBottomNav extends StatefulWidget {
  const ResponsiveBottomNav({Key? key}) : super(key: key);

  @override
  _ResponsiveBottomNavState createState() => _ResponsiveBottomNavState();
}

class _ResponsiveBottomNavState extends State<ResponsiveBottomNav> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.blue.shade100,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (index) {
          HapticFeedback.mediumImpact();
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: List.generate(
          4,
          (index) => NavigationDestination(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: index == selectedIndex
                    ? Colors.amberAccent.shade200.withOpacity(0.7)
                    : Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      getIconData(index),
                      color: index == selectedIndex
                          ? Colors.black.withOpacity(.20)
                          : Colors.grey[800],
                      size: width < 600 ? 24 : 32,
                    ),
                    const SizedBox(width: 8),
                    if (index == selectedIndex)
                      Text(
                        getIconLabel(index),
                        style: TextStyle(
                            color: Colors.black.withOpacity(.20),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                  ],
                ),
              ),
            ),
            label: '', // Empty string to avoid duplicate labels
          ),
        ),
      ),
    );
  }

  IconData getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.home_rounded;
      case 1:
        return Icons.record_voice_over_rounded;
      case 2:
        return Icons.school_rounded;
      case 3:
        return Icons.person_rounded;
      default:
        return Icons.home_rounded;
    }
  }

  String getIconLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'EOP';
      case 2:
        return 'School';
      case 3:
        return 'Profile';
      default:
        return 'Home';
    }
  }
}
