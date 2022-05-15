import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/widgets/flight_row.dart';

class SearchFlight extends StatelessWidget {
  SearchFlight({Key key, this.depStr, this.arrStr, this.date}) : super(key: key);
  final String depStr;
  final String arrStr;
  final String date;
  var result = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService.instance.flightsQue(depStr, arrStr, date),
        initialData: null,
        builder: (context, snapshot) {
          result = snapshot.data;
          print(snapshot.data);
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
              leading: const Drawer(
                elevation: 0,
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        depStr,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                      ),
                      Text(
                        arrStr,
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
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 35,
                        ),
                        Text(
                          date.substring(5),
                          style: const TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: result.map((e) => FlightRow(flight: e)).toList(),
                  )
                ],
              ),
            ),
          ));
        });
  }
}
