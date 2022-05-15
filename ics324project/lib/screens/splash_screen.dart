import 'package:flutter/material.dart';
import 'package:ics324project/screens/start_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplash extends StatelessWidget {
  const MySplash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: StartScreen(),
      image: const Image(image: AssetImage('image/logo.png')),
      photoSize: 150,
      title: const Text(
        'Start \ntraveling \ntoday',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'YuseiMagic',
          color: Color(0xFF625B71),
          fontSize: 32,
        ),
      ),
      loaderColor: Colors.transparent,
      loadingText: Text(
        'ALL RIGHTS PRESERVED',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
