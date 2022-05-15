import 'package:flutter/material.dart';
import 'package:ics324project/widgets/bottom_navi.dart';
import 'package:intl/intl.dart';

import '../widgets/globals.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  DateTime _date = DateTime.now().subtract(const Duration(days: 1));

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
        leading: Drawer(
          elevation: 0,
          child: GestureDetector(
            child: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Card Number',
                  hintStyle: Globals.kHintStyle,
                  prefixIcon: Icon(
                    Icons.credit_card,
                    color: Globals.kIconColor,
                  )),
            ),
          ),
          const SizedBox(
            width: 200,
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Name',
                    hintStyle: Globals.kHintStyle,
                    prefixIcon: Icon(Icons.people_alt_outlined, color: Globals.kIconColor))),
          ),
          Row(
            children: [
              const SizedBox(
                width: 118,
              ),
              GestureDetector(
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
                        (_date.compareTo(DateTime.now())) == -1 ? "select date" : DateFormat('yyyy-MM').format(_date),
                        style: TextStyle(
                            //fontFamily: 'Poppins',
                            //fontSize: 16,
                            color: Colors.grey[600]),
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
            ],
          ),
          const SizedBox(
            width: 200,
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'CSC',
                    hintStyle: Globals.kHintStyle,
                    prefixIcon: Icon(Icons.password, color: Globals.kIconColor))),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
                },
                child: const Text('Search'),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size.fromWidth(125)),
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Color(0xFF18C0C1)))),
                  elevation: MaterialStateProperty.all(0),
                ),
              ),
              const SizedBox(
                width: 30,
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavi(index: 2),
    );
  }
}
