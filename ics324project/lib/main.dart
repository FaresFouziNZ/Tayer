import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ics324project/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {'/': (context) => const MySplash()},
  ));
}
