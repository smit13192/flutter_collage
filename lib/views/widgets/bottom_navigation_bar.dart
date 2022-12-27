import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavigationBar extends StatelessWidget {
  int bottomNavigationIndex;
  final Function(int) onTabChanged;

  MyBottomNavigationBar(
      {required this.onTabChanged,
      required this.bottomNavigationIndex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: GNav(
        duration: const Duration(seconds: 1),
        selectedIndex: bottomNavigationIndex,
        onTabChange: onTabChanged,
        tabBackgroundColor: Colors.grey.shade200,
        activeColor: Colors.black,
        color: Colors.black87,
        padding: const EdgeInsets.all(15),
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: "Home",
          ),
          GButton(
            icon: Icons.search,
            text: "Search",
          ),
          GButton(
            icon: Icons.favorite_border_outlined,
            text: "Favourite",
          ),
          GButton(
            icon: Icons.person,
            text: "Profile",
          ),
        ],
      ),
    );
  }
}
