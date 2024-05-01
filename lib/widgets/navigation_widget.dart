import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Container(),
          label: 'Save and Proceed',
          backgroundColor: Colors.red,
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
          backgroundColor: Colors.red,
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back),
          label: '',
        ),
      ],
    );
  }
}
