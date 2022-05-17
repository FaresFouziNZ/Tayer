import 'package:flutter/material.dart';
import 'package:ics324project/classes/flight.dart';

class FlightInfoCard extends StatefulWidget {
  final Flight flight;
  const FlightInfoCard({Key key, @required this.flight}) : super(key: key);

  @override
  State<FlightInfoCard> createState() => _FlightInfoCardState();
}

class _FlightInfoCardState extends State<FlightInfoCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 150,
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
              width: 120,
              //color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.flight.departure_location,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                  ),
                  Text(
                    widget.flight.arrival_location,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.watch_later_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                Text(
                  widget.flight.departure_time,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                ),
                const Icon(
                  Icons.watch_later_outlined,
                  color: Colors.grey,
                  size: 16,
                ),
                Text(
                  widget.flight.arrival_time,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
