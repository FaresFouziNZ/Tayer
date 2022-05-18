import 'package:flutter/material.dart';

class TicketCard extends StatefulWidget {
  TicketCard({Key key, @required this.state}) : super(key: key);
  int state;
  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  Color colorSelector() {
    if (widget.state == 1) {
      return const Color(0xFFCF5C86);
    } else if (widget.state == 2) {
      return const Color(0xFF9C5CCF);
    } else {
      return const Color(0xFF5C83CF);
    }
  }

  Text costSelector() {
    if (widget.state == 1) {
      return const Text(
        '400',
      );
    } else if (widget.state == 2) {
      return const Text('200');
    } else {
      return const Text('100');
    }
  }

  Text classId() {
    if (widget.state == 1) {
      return const Text(
        'First',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      );
    } else if (widget.state == 2) {
      return const Text(
        'Business',
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      );
    } else {
      return const Text(
        'Economy',
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 80,
      child: Card(
        color: colorSelector(),
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            Container(
                decoration:
                    const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 15,
                width: 50,
                //color: Colors.white,
                child: Center(child: classId())),
            const SizedBox(
              height: 10,
            ),
            costSelector()
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
