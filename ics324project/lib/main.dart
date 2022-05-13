import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Hi'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: 300,
                height: 100,
                //color: Colors.amber,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}
