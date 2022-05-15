import 'package:flutter/material.dart';
import 'package:ics324project/classes/user.dart';
import 'package:ics324project/widgets/globals.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProgUser>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'T A Y E R ™',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Drawer(
          elevation: 0,
          child: GestureDetector(
            child: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async {},
                              child: const Text('Contact Us'),
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(const Size.fromWidth(250)),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: const BorderSide(color: Color(0xFF18C0C1)))),
                                elevation: MaterialStateProperty.all(0),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {},
                              child: const Text('About Us'),
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(const Size.fromWidth(250)),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: const BorderSide(color: Color(0xFF18C0C1)))),
                                elevation: MaterialStateProperty.all(0),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {},
                              child: const Text('Dark Mode'),
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(const Size.fromWidth(250)),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: const BorderSide(color: Color(0xFF18C0C1)))),
                                elevation: MaterialStateProperty.all(0),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {},
                              child: const Text('Logout'),
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(const Size.fromWidth(250)),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFFB20000)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: const BorderSide(color: Color(0xFFB20000)))),
                                elevation: MaterialStateProperty.all(0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // child: SizedBox(
                      //   height: 300,
                      //   child: Container(
                      //     height: 100,
                      //     decoration: BoxDecoration(
                      //         border: Border.all(width: 3, color: Colors.black),
                      //         borderRadius: const BorderRadius.all(Radius.circular(10))),
                      //   ),
                      // ),
                    );
                  });
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 16, 0, 40),
              child: CircleAvatar(backgroundImage: AssetImage('image/4zueyq.png'), radius: 75),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: user.uid,
                    hintStyle: Globals.kHintStyle,
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Globals.kIconColor,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
