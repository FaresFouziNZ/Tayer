import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/auth.dart';
import 'package:ics324project/screens/register.dart';
import 'package:ics324project/widgets/bottom_navi.dart';

import '../widgets/globals.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = AuthService();
  String email = '';
  String password = '';

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text('LOGIN'),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintText: 'Email',
                      hintStyle: Globals.kHintStyle,
                      prefixIcon: Icon(Icons.email_outlined)),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        hintText: 'password',
                        hintStyle: Globals.kHintStyle,
                        prefixIcon: Icon(Icons.lock)),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                        },
                        child: const Text(
                          'Register new account',
                          style: TextStyle(color: Color(0xFF18C0C1), fontSize: 16),
                        )),
                    const SizedBox(
                      width: 100,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        RegExp regExp = RegExp('.*@.*');
                        if (regExp.hasMatch(email) && (password.length > 6)) {
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() async {});
                          } else {
                            print('good!');
                          }
                        } else {}
                      },
                      child: const Text('Login'),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(const Size.fromWidth(125)),
                        backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Color(0xFF18C0C1)))),
                        elevation: MaterialStateProperty.all(0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavi(index: 2),
    );
  }
}
