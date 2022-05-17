import 'package:flutter/material.dart';
import 'package:ics324project/screens/seats_page.dart';
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SeatsPage(
                            flightBooked: flight,
                            classState: 1,
                          )));
            },
          ),
          InkWell(
            child: TicketCard(state: 2),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SeatsPage(
                            flightBooked: flight,
                            classState: 2,
                          )));
            },
          ),
          InkWell(
            child: TicketCard(state: 3),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SeatsPage(
                            flightBooked: flight,
                            classState: 3,
                          )));
            },
          )
        ],
      ),
    );
  }
}
