import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Hi'),
      ),
      body: Column(
        children: [
          Row(children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.accents,
            ),
            Container()
          ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
          Row(children: [Container(), Container()], mainAxisAlignment: MainAxisAlignment.spaceBetween)
        ],
      ),
    ),
  ));
}
