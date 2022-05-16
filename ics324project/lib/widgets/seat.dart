import 'package:flutter/material.dart';

class Seat extends StatelessWidget {
  Seat({Key key, this.state}) : super(key: key);
  int state;
  bool isBooked;
  Color colorSelector(state) {
    if (state == 1) {
      return const Color(0xFFCF5C86);
    } else if (state == 2) {
      return const Color(0xFF9C5CCF);
    } else {
      return const Color(0xFF5C83CF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 35,
          height: 35,
          color: colorSelector(state),
          child: Visibility(
            visible: false,
            child: Container(
              width: 25,
              height: 25,
              color: const Color(0x99FFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
