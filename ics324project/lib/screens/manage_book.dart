import 'package:flutter/material.dart';
import 'package:ics324project/widgets/globals.dart';

import '../widgets/bottom_navi.dart';

class ManageBooking extends StatelessWidget {
  int index;
  ManageBooking({Key key}) : super(key: key);
  String bookingRef = '';
  String lastName = '';
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      //TODO
                    },
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
  }
}
