import 'package:flutter/material.dart';
import 'package:ics324project/screens/seats_page.dart';
import 'package:ics324project/screens/splash_screen.dart';
import 'package:ics324project/widgets/bottom_navi.dart';
import 'package:intl/intl.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  DateTime _date = DateTime.now().subtract(const Duration(days: 1));
  int _guests = 0;
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
        leading: const Drawer(
          elevation: 0,
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                          children: const [
                            SizedBox(
                              width: 110,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Departure',
                                    hintStyle: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                    prefixIcon: Icon(Icons.search)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 110,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Arrival',
                                    hintStyle: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                    prefixIcon: Icon(Icons.search)),
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
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    color: Color(0xFF625B71),
                                  ),
                                  const SizedBox(
                                    width: 32,
                                  ),
                                  Text(
                                    (_date.compareTo(DateTime.now())) == -1
                                        ? "select date"
                                        : DateFormat('yyyy-MM-dd').format(_date),
                                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 16),
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
                              //_date = pickedDate;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(12, 8, 6, 8),
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF625B71),
                              ),
                            ),
                            const SizedBox(
                              width: 26,
                            ),
                            const Text(
                              "guests",
                              style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            GestureDetector(
                              child: GestureDetector(
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                                onTap: () {
                                  if (_guests > 0) {
                                    _guests = _guests - 1;
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              _guests.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                              onTap: () {
                                _guests = _guests + 1;
                                setState(() {});
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MySplash()));
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
                      )
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                width: 300,
                height: 400,
                //color: Colors.amber,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 3, color: Colors.black),
                //     borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavi(),
    );
  }
}
