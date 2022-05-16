import 'package:flutter/material.dart';
import 'package:ics324project/widgets/seat.dart';

class SeatsPage extends StatefulWidget {
  const SeatsPage({Key key}) : super(key: key);

  @override
  State<SeatsPage> createState() => _SeatsPageState();
}

class _SeatsPageState extends State<SeatsPage> {
  List<Seat> seatgene() {
    List<Seat> x = [];
    for (int i = 1; i < 91; i++) {
      x.add(Seat());
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'SEAT SELECTION',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: const Drawer(
          elevation: 0,
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('A    B    C    D     E     F'),
              Wrap(
                children: seatgene(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
