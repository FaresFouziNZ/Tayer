import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ics324project/screens/start_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplash extends StatelessWidget {
  const MySplash({Key key}) : super(key: key);
  Future<Widget> start() async {
    await Firebase.initializeApp();
    await Duration(seconds: 10);
    return StartScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: start(),
      image: const Image(image: AssetImage('image/logo.png')),
    );
  }
}
