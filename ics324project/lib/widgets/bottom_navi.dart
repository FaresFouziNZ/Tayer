import 'package:flutter/material.dart';

class BottomNavi extends StatefulWidget {
  BottomNavi({Key key}) : super(key: key);

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      currentIndex: _currentIndex,
      onTap: (_index) => setState(() => _currentIndex = _index),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.draw_outlined), label: '2'),
        BottomNavigationBarItem(icon: Icon(Icons.airplanemode_active), label: '3'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: '4',
        )
      ],
    );
  }
}
