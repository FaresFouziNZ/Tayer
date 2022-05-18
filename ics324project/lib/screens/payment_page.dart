import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/classes/flight.dart';
import 'package:ics324project/classes/prog_user.dart';
import 'package:ics324project/screens/start_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/globals.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key, this.classState, this.flight, this.seatNo, this.previousFlight}) : super(key: key);
  int classState;
  Flight flight;
  String seatNo;
  Flight previousFlight;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  DateTime _date = DateTime.now().subtract(const Duration(days: 1));
  String _cardNumber = '';
  String _cardName = '';
  String _cardCSC = '';
  double total = 0;
  double flightFees = 0;
  double seatFees = 0;
  setPrice() {
    if (widget.classState == 1) {
      flightFees = 400;
      seatFees = 60;
      total = flightFees + seatFees;
    } else if (widget.classState == 2) {
      flightFees = 200;
      seatFees = 40;
      total = flightFees + seatFees;
    } else if (widget.classState == 3) {
      flightFees = 100;
      seatFees = 20;
      total = flightFees + seatFees;
    }
  }

  @override
  Widget build(BuildContext context) {
    setPrice();
    final user = Provider.of<ProgUser>(context);
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (text) {
                  _cardNumber = text;
                },
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Card Number',
                    hintStyle: Globals.kHintStyle,
                    prefixIcon: Icon(
                      Icons.credit_card,
                      color: Globals.kIconColor,
                    )),
              ),
            ),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                    onChanged: (text) {
                      _cardName = text;
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                        hintStyle: Globals.kHintStyle,
                        prefixIcon: Icon(Icons.people_alt_outlined, color: Globals.kIconColor))),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 118,
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.date_range,
                            color: Color(0xFF625B71),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            (_date?.compareTo(DateTime.now())) == -1
                                ? "select date"
                                : DateFormat('yyyy-MM').format(_date),
                            style: TextStyle(
                                //fontFamily: 'Poppins',
                                //fontSize: 16,
                                color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () async {
                    await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 9999)))
                        .then((value) => _date = value);
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
              width: 200,
              child: TextField(
                  onChanged: (text) {
                    _cardCSC = text;
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'CSC',
                      hintStyle: Globals.kHintStyle,
                      prefixIcon: Icon(Icons.password, color: Globals.kIconColor))),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 70,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'FLIGHT FEES',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            flightFees.toString() + ' SAR',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'SEAT FEES',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            seatFees.toString() + ' SAR',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                      Container(
                        width: 200,
                        height: 4,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'TOTAL',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            total.toString() + ' SAR',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_cardNumber.length != 16 || _cardCSC.length != 3) {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Invalid Input'),
                                content: const Text('Please check your input'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Ok'))
                                ],
                              ));
                    } else {
                      if (widget.previousFlight != null) {
                        //TODO delete ticket
                      }
                      String bookingRef = DatabaseService().createBookingRef();
                      await DatabaseService().bookFlight(widget.flight.id, bookingRef, widget.classState, user.uid);
                      await DatabaseService().selectSeat(bookingRef, widget.seatNo, user.uid, widget.flight.id);
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Thank you'),
                                content: Text('Your booking ID is: ' + bookingRef),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);

                                        Navigator.pop(context);

                                        Navigator.pop(context);

                                        Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen()));
                                      },
                                      child: const Text('Ok'))
                                ],
                              ));
                    }
                  },
                  child: const Text('Pay'),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size.fromWidth(125)),
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Color(0xFF18C0C1)))),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
                // const SizedBox(
                //   width: 30,
                // )
              ],
            )
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavi(index: 2),
    );
  }
}
