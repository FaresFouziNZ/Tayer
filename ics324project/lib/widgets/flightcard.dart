import 'package:flutter/material.dart';
import 'package:ics324project/classes/flight.dart';

class FlightInfoCard extends StatefulWidget {
  Flight flight;
  FlightInfoCard({Key key, @required this.flight}) : super(key: key);

  @override
  State<FlightInfoCard> createState() => _FlightInfoCardState();
}

class _FlightInfoCardState extends State<FlightInfoCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 200,
      child: Card(
        color: const Color(0xFF8FCF5C),
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 15,
              width: 170,
              //color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.flight.departure),
                  const Icon(
                    Icons.arrow_forward,
                    size: 18,
                  ),
                  Text(
                    widget.flight.destination,
                    //style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.watch_later_outlined,
                  color: Color(0xFFFFC267),
                ),
                Text('13:13'),
                Icon(Icons.arrow_forward),
                Icon(
                  Icons.watch_later_outlined,
                  color: Colors.grey,
                ),
                Text('13:14')
              ],
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
