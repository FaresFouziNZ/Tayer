import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/classes/booking.dart';

class TicketCard extends StatelessWidget {
  TicketCard({Key key, this.bookingDetails}) : super(key: key);
  Booking bookingDetails;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DatabaseService().flightById(bookingDetails.fid),
        builder: ((context, snapshot) {
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 390,
                height: 125,
                color: Colors.amber,
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
                          'FLIGHT NUMBER',
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
                        Text(bookingDetails.bid),
                        Text(bookingDetails.bid),
                        Text(bookingDetails.classType.toString()),
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
                            children: const [
                              Text('DMM'),
                              Icon(
                                Icons.arrow_forward,
                                size: 14,
                              ),
                              Text('JED')
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
                                    children: const [Icon(Icons.calendar_today_outlined), Text('OCT 27th')],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: const [
                                      Icon(Icons.watch_later_outlined),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('3:40'),
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
          );
        }));
  }
}
