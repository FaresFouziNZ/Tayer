import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          SizedBox(
                            width: 110,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Departure',
                                  hintStyle: TextStyle(fontSize: 12),
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
                                  hintText: 'Arrival',
                                  hintStyle: TextStyle(fontSize: 12),
                                  prefixIcon: Icon(Icons.search)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                width: 300,
                height: 400,
                //color: Colors.amber,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
