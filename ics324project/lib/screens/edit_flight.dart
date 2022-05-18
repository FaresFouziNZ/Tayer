import 'package:flutter/material.dart';
import 'package:ics324project/classes/flight.dart';
import 'package:ics324project/screens/sreach_flight.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../classes/prog_user.dart';

class EditFlight extends StatefulWidget {
  Flight previousFlight;
  EditFlight({Key key, this.previousFlight}) : super(key: key);

  @override
  State<EditFlight> createState() => _EditFlightState();
}

class _EditFlightState extends State<EditFlight> {
  List<String> city = [
    'RUH',
    'JED',
    'DMM',
    'MED',
    'AHB',
    'ELQ',
    'TIF',
    'HAS',
    'ULH',
    'AJF',
    'TUU',
    'EAM',
    'YNB',
    'GIZ',
    'HOF'
  ];
  String _departure = '', _arrival = '';
  DateTime _date = DateTime.now().subtract(const Duration(days: 1));
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProgUser>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Edit your booking', style: TextStyle(fontFamily: 'Poppins', fontSize: 24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 110,
                              child: TextField(
                                onChanged: (text) {
                                  if (city.contains(text.toUpperCase())) {
                                    _departure = text.toUpperCase();
                                  } else {
                                    _departure = "";
                                  }
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: widget.previousFlight.departure_location,
                                    hintStyle: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                    prefixIcon: const Icon(Icons.search)),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 110,
                              child: TextField(
                                onChanged: (text) {
                                  if (city.contains(text.toUpperCase())) {
                                    _arrival = text.toUpperCase();
                                  } else {
                                    _arrival = "";
                                  }
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: widget.previousFlight.arrival_location,
                                    hintStyle: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                    prefixIcon: const Icon(Icons.search)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    color: Color(0xFF625B71),
                                  ),
                                  const SizedBox(
                                    width: 32,
                                  ),
                                  Text(
                                    (_date?.compareTo(DateTime.now())) == -1
                                        ? "select date"
                                        : DateFormat('yyyy-MM-dd')?.format(_date),
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: _date.compareTo(DateTime.now()) == -1
                                            ? const Color(0xAA625B71)
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now().add(const Duration(days: 365)))
                                  .then((value) => _date = value);
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (user.uid == null) {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: const Text('You are not logged in'),
                                        content: const Text('Please register or sign in'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Ok'))
                                        ],
                                      ));
                            } else {
                              if (_departure.isNotEmpty &&
                                  _arrival.isNotEmpty &&
                                  (_departure.compareTo(_arrival) != 0)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchFlight(
                                              arrStr: _arrival.toUpperCase(),
                                              depStr: _departure.toUpperCase(),
                                              date: DateFormat('yyyy-MM-dd')?.format(_date),
                                            )));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: const Text('Invalid City'),
                                          content: const Text('Please check your input'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Ok'))
                                          ],
                                        ));
                              }
                            }
                          },
                          child: const Text('Search'),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(const Size.fromWidth(125)),
                            backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: const BorderSide(color: Color(0xFF18C0C1)))),
                            elevation: MaterialStateProperty.all(0),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: const Text('Warning:'),
                                    content: const Text('Are you sure you want to cancel this booking?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('No, I do not')),
                                      TextButton(
                                          onPressed: () {
                                            //TODO Cancel booking
                                          },
                                          child: const Text('Yes, cancel this booking'))
                                    ],
                                  ));
                        },
                        child: const Text(
                          'Cancel this booking>',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                width: 300,
                // height: 400,
                //color: Colors.amber,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 3, color: Colors.black),
                //     borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
