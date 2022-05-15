import 'package:flutter/material.dart';
import 'package:ics324project/screens/loginpage.dart';
import 'package:ics324project/screens/manage_book.dart';
import 'package:ics324project/screens/start_screen.dart';

import 'gradicon.dart';

class BottomNavi extends StatefulWidget {
  int index;
  BottomNavi({Key key, @required this.index}) : super(key: key);

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int _currentIndex = 0;
  final screens = [ManageBooking(), StartScreen(), const LoginPage()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      unselectedItemColor: const Color(0xFF231F20),
      elevation: 0,
      currentIndex: _currentIndex,
      onTap: (_index) {
        _currentIndex = _index;
        setState(() {});
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => screens[_index]));
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(color: Colors.green),
      items: [
        BottomNavigationBarItem(
            icon: GradientIcon(
                Icons.bookmark_outline,
                40,
                LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.index == 0
                        ? [const Color(0xFF5C83CF), const Color(0xFFCF5C86), const Color(0xFF9C5CCF)]
                        : [Colors.black, Colors.black])),
            label: '2'),
        BottomNavigationBarItem(
            label: 'asd',
            icon: GradientIcon(
                Icons.flight,
                40,
                LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.index == 1
                        ? [const Color(0xFF5C83CF), const Color(0xFFCF5C86), const Color(0xFF9C5CCF)]
                        : [Colors.black, Colors.black]))),
        BottomNavigationBarItem(
          icon: GradientIcon(
              Icons.person_outline,
              40,
              LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _currentIndex == 3
                      ? [const Color(0xFF5C83CF), const Color(0xFFCF5C86), const Color(0xFF9C5CCF)]
                      : [Colors.black, Colors.black])),
          label: '4',
        )
      ],
    );
  }
}
