import 'package:flutter/material.dart';
import 'package:ics324project/screens/splash_screen.dart';
import 'package:ics324project/screens/start_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {'/': (context) => const MySplash()},
  ));
}
