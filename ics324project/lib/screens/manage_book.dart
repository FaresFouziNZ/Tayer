import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/classes/prog_user.dart';
import 'package:ics324project/widgets/globals.dart';
import 'package:ics324project/widgets/ticket_card.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_navi.dart';

class ManageBooking extends StatefulWidget {
  const ManageBooking({Key key}) : super(key: key);

  @override
  State<ManageBooking> createState() => _ManageBookingState();
}

class _ManageBookingState extends State<ManageBooking> {
  int index;

  String bookingRef = '';

  String lastName = '';

  var result = [];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProgUser>(context);

    if (user?.uid == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'T A Y E R ™',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text('MANAGE BOOKING', style: TextStyle(fontFamily: 'Poppins', fontSize: 24)),
                const SizedBox(
                  height: 38,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        onChanged: (text) {
                          bookingRef = text;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Booking Reference',
                            hintStyle: Globals.kHintStyle,
                            prefixIcon: Icon(Icons.bookmark_border_outlined)),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        onChanged: (text) {
                          lastName = text;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Passenger Last Name',
                            hintStyle: Globals.kHintStyle,
                            prefixIcon: Icon(Icons.people_alt_outlined)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Search'),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(const Size.fromWidth(125)),
                        backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Color(0xFF18C0C1)))),
                        elevation: MaterialStateProperty.all(0),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavi(
          index: 0,
        ),
      );
    } else {
      return FutureBuilder<List<dynamic>>(
          future: DatabaseService.instance.getBooking(user.uid),
          builder: (context, snapshot) {
            result = snapshot.data;
            if (!(snapshot.connectionState == ConnectionState.done)) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: const Text(
                    'T A Y E R ™',
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                ),
                body: const Center(
                  child: Text('Loading'),
                ),
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
                      height: 20,
                    ),
                    const Text('MANAGE YOUR BOOKING'),
                    Column(
                      children: result
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TicketCard(
                                  bookingDetails: e,
                                ),
                              ))
                          .toList(),
                    )
                    // Column(
                    //   children: result
                    //       .map((e) => TicketCard(
                    //             bookingDetails: e,
                    //           ))
                    //       .toList(),
                    // )
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavi(index: 0),
            ));
          });
    }
  }
}
