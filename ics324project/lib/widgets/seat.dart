import 'package:flutter/material.dart';
import 'package:ics324project/classes/flight.dart';
import 'package:ics324project/screens/payment_page.dart';

class Seat extends StatelessWidget {
  Seat({Key key, this.state, this.seatNo, this.isBooked, this.flightBook}) : super(key: key);
  int state;
  String seatNo;
  bool isBooked;
  Flight flightBook;
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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentPage(
                        flight: flightBook,
                        classState: 3,
                        seatNo: seatNo,
                      )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 35,
            height: 35,
            color: colorSelector(state),
            child: Visibility(
              visible: isBooked ?? false,
              child: Container(
                width: 35,
                height: 35,
                color: const Color(0x99FFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
