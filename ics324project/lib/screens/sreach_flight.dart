import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/widgets/flight_row.dart';

import '../classes/flight.dart';

class SearchFlight extends StatefulWidget {
  SearchFlight({Key key, this.depStr, this.arrStr, this.date, this.previousFlight}) : super(key: key);
  final String depStr;
  final String arrStr;
  final String date;
  Flight previousFlight;

  @override
  State<SearchFlight> createState() => _SearchFlightState();
}

class _SearchFlightState extends State<SearchFlight> {
  var result = [];

  int ticketType;
  callbackFunc(newTicketType) {
    setState(() {
      ticketType = newTicketType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DatabaseService.instance.flights(widget.depStr, widget.arrStr, widget.date),
        initialData: null,
        builder: (context, snapshot) {
          result = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: Text('Loading')),
            );
          }
          return NotificationListener(
              child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'T A Y E R ™',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.depStr,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                      ),
                      Text(
                        widget.arrStr,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 3,
                        ),
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 35,
                        ),
                        Text(
                          widget.date.substring(5),
                          style: const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          width: 3,
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: result
                        .map((e) => FlightRow(
                              flight: e,
                              callBack: callbackFunc,
                              previousFlight: widget.previousFlight,
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          ));
        });
  }
}
