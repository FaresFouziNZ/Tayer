import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/classes/booking.dart';
import 'package:ics324project/screens/edit_flight.dart';

import '../classes/flight.dart';

class TicketCard extends StatelessWidget {
  TicketCard({Key key, this.bookingDetails}) : super(key: key);
  Booking bookingDetails;
  Flight gettedFlight;

  String className() {
    if (bookingDetails.classType == 1) {
      return 'First';
    } else if (bookingDetails.classType == 2) {
      return 'Business';
    } else if (bookingDetails.classType == 1) {
      return 'Economy';
    } else {
      return 'Wait-listed';
    }
  }

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
    return FutureBuilder(
        future: DatabaseService().flightById(bookingDetails.fid),
        builder: ((context, snapshot) {
          gettedFlight = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: Text('loading'),
            );
          }
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditFlight(
                            previousFlight: gettedFlight,
                          )));
            },
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 390,
                  height: 125,
                  color: colorSelector(bookingDetails.classType),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'FLIGHT NAME',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'BOOKING REF',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'CLASS',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(gettedFlight.planeName),
                          Text(bookingDetails.bid),
                          Text(className()),
                        ],
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          width: 5,
                          height: 110,
                          color: Colors.black,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                            height: 15,
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(gettedFlight.departure_location),
                                const Icon(
                                  Icons.arrow_forward,
                                  size: 14,
                                ),
                                Text(gettedFlight.arrival_location)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                color: const Color(0x55FFFFFF),
                                width: 100,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(Icons.calendar_today_outlined),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(gettedFlight.departure_date.substring(5))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(Icons.watch_later_outlined),
                                        const SizedBox(
                                          width: 0,
                                        ),
                                        Text(gettedFlight.departure_time),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
