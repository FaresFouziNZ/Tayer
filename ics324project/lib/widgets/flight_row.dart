import 'package:flutter/material.dart';
import 'package:ics324project/widgets/flightcard.dart';
import 'package:ics324project/widgets/ticketcard.dart';

import '../classes/flight.dart';

class FlightRow extends StatefulWidget {
  Flight flight;
  FlightRow({Key key, @required this.flight}) : super(key: key);

  @override
  State<FlightRow> createState() => _FlightRowState();
}

class _FlightRowState extends State<FlightRow> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FlightInfoCard(flight: widget.flight),
          TicketCard(state: 1),
          TicketCard(state: 2),
          TicketCard(state: 3)
        ],
      ),
    );
  }
}
