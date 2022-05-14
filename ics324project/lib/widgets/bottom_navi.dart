import 'package:flutter/material.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({Key key}) : super(key: key);

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      unselectedItemColor: const Color(0xFF231F20),
      selectedItemColor: Colors.black,
      elevation: 0,
      currentIndex: _currentIndex,
      onTap: (_index) => setState(() => _currentIndex = _index),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(color: Colors.green),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.draw_outlined,
              size: 40,
            ),
            label: '2'),
        BottomNavigationBarItem(icon: Icon(Icons.airplanemode_active, size: 30), label: '3'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: '4',
        )
      ],
    );
  }
}
