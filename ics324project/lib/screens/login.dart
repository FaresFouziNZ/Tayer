import 'package:flutter/material.dart';

import '../widgets/globals.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              const SizedBox(
                width: 300,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintText: 'username',
                      hintStyle: Globals.kHintStyle,
                      prefixIcon: Icon(Icons.people_alt_outlined)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        hintText: 'password',
                        hintStyle: Globals.kHintStyle,
                        prefixIcon: Icon(Icons.lock)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 190,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
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
    );
  }
}
