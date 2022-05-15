import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/auth.dart';
import 'package:ics324project/classes/user.dart';
import 'package:ics324project/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<ProgUser>.value(
    value: AuthService().user,
    initialData: null,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const MySplash()},
    ),
  ));
}
