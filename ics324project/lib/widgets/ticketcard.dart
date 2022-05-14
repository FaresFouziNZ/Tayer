import 'package:flutter/material.dart';

class TicketCard extends StatefulWidget {
  TicketCard({Key key, @required this.state}) : super(key: key);
  int state;
  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  Color s() {
    if (widget.state == 1) {
      return const Color(0xFFCF5C86);
    } else if (widget.state == 2) {
      return const Color(0xFF9C5CCF);
    } else {
      return const Color(0xFF5C83CF);
    }
  }

  Text t() {
    if (widget.state == 1) {
      return const Text('400');
    } else if (widget.state == 2) {
      return const Text('200');
    } else {
      return const Text('50');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 120,
      child: Card(
        color: s(),
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            Container(
                decoration:
                    const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 15,
                width: 90,
                //color: Colors.white,
                child: const Center(child: Text('First'))),
            const SizedBox(
              height: 10,
            ),
            t()
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
