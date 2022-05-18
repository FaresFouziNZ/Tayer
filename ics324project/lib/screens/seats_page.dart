import 'package:flutter/material.dart';
import 'package:ics324project/classes/flight.dart';
import 'package:ics324project/screens/payment_page.dart';
import 'package:ics324project/widgets/seat.dart';

class SeatsPage extends StatefulWidget {
  SeatsPage({Key key, this.classState, this.flightBooked, this.previousFlight}) : super(key: key);
  int classState;
  Flight flightBooked;
  Flight previousFlight;

  @override
  State<SeatsPage> createState() => _SeatsPageState();
}

class _SeatsPageState extends State<SeatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'SEAT SELECTION',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('     1           2           3                 4           5           6           '),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 130,
                    child: Wrap(
                      children: [
                        Seat(
                          seatNo: 'A1',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'A2',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'A3',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'B1',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'B2',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'B3',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'C1',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'C2',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'C3',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'D1',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'D2',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'D3',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'E1',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'E2',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'E3',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'F1',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'F2',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'F3',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'G1',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'G2',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'G3',
                          state: 2,
                          previousFlight: widget.previousFlight,
                          flightBook: widget.flightBooked,
                        ),
                        Seat(
                          seatNo: 'H1',
                          state: 3,
                          previousFlight: widget.previousFlight,
                          flightBook: widget.flightBooked,
                        ),
                        Seat(
                          seatNo: 'H2',
                          state: 3,
                          previousFlight: widget.previousFlight,
                          flightBook: widget.flightBooked,
                        ),
                        Seat(
                          seatNo: 'H3',
                          state: 3,
                          previousFlight: widget.previousFlight,
                          flightBook: widget.flightBooked,
                        ),
                        Seat(
                          seatNo: 'I1',
                          state: 3,
                          previousFlight: widget.previousFlight,
                          flightBook: widget.flightBooked,
                        ),
                        Seat(
                          seatNo: 'I2',
                          state: 3,
                          previousFlight: widget.previousFlight,
                          flightBook: widget.flightBooked,
                        ),
                        Seat(
                          seatNo: 'I3',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'J1',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'J2',
                          state: 3,
                          previousFlight: widget.previousFlight,
                          flightBook: widget.flightBooked,
                        ),
                        Seat(
                          seatNo: 'J3',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'K1',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'K2',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'K3',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'L1',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'L2',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'L3',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'M1',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'M2',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'M3',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 30,
                  ),
                  SizedBox(
                    width: 130,
                    child: Wrap(
                      children: [
                        Seat(
                          seatNo: 'A4',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'A5',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'A6',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'B4',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'B5',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'B6',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'C4',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'C5',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'C6',
                          state: 1,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'D4',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'D5',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'D6',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'E4',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'E5',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'E6',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'F4',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'F5',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'F6',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'G4',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'G5',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'G6',
                          state: 2,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'H4',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'H5',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'H6',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'I4',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'I5',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'I6',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'J4',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'J5',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'J6',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'K4',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'K5',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'K6',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'L4',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'L5',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'L6',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'M4',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'M5',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                        Seat(
                          seatNo: 'M6',
                          state: 3,
                          flightBook: widget.flightBooked,
                          previousFlight: widget.previousFlight,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 520,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentPage(
                                        flight: widget.flightBooked,
                                      )));
                        },
                        child: const Text('Skip seat'),
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(const Size.fromWidth(100)),
                          backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: const BorderSide(color: Color(0xFF18C0C1)))),
                          elevation: MaterialStateProperty.all(0),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
