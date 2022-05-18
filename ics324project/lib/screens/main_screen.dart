import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/classes/prog_user.dart';
import 'package:ics324project/screens/manage_book.dart';
import 'package:ics324project/screens/start_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProgUser>(context);

    return FutureBuilder(
        future: DatabaseService.instance.userById(user?.uid),
        builder: (context, snapshot) {
          return NotificationListener(
              child: Scaffold(
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
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Image(image: AssetImage('image/logo.png'), width: 350),
                  const Text(
                    'Welcome\nback!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'YuseiMagic',
                      color: Color(0xFF000000),
                      fontSize: 52,
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: user?.isAdmin == true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              Icons.article_outlined,
                              size: 52,
                            ),
                            Icon(
                              Icons.person_add_outlined,
                              size: 52,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ManageBooking()));
                            },
                            child: const Icon(
                              Icons.draw_outlined,
                              size: 52,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen()));
                            },
                            child: const Icon(
                              Icons.flight,
                              size: 52,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen()));
                            },
                            child: const Icon(
                              Icons.person_outline,
                              size: 52,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
        });
  }
}
