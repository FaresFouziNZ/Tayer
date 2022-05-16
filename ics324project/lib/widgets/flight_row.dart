import 'package:flutter/material.dart';
import 'package:ics324project/widgets/flightcard.dart';
import 'package:ics324project/widgets/ticketcard.dart';

import '../classes/flight.dart';

class FlightRow extends StatelessWidget {
  Flight flight;
  FlightRow({Key key, @required this.flight, this.callBack, this.type}) : super(key: key);
  final Function callBack;
  int type;
//   @override
//   State<FlightRow> createState() => _FlightRowState();
// }

// class _FlightRowState extends State<FlightRow> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FlightInfoCard(flight: flight),
          InkWell(
            child: TicketCard(state: 1),
            onTap: () {
              callBack() {}
            },
          ),
          InkWell(
            child: TicketCard(state: 2),
          ),
          InkWell(child: TicketCard(state: 3))
        ],
      ),
    );
  }
}
