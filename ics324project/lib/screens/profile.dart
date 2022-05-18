import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/auth.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/classes/prog_user.dart';
import 'package:ics324project/screens/start_screen.dart';
import 'package:ics324project/widgets/globals.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProgUser>(context);
    final AuthService _auth = AuthService();

    return FutureBuilder(
        future: DatabaseService.instance.userById(user?.uid),
        builder: (context, snapshot) {
          if (!(snapshot.connectionState == ConnectionState.done)) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'T A Y E R ™',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: const Center(
                child: Text('Loading'),
              ),
            );
          }
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
                          hintText: snapshot.data?.firstName,
                          hintStyle: Globals.kHintStyle,
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Globals.kIconColor,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      enableInteractiveSelection: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'User id: ' + snapshot.data?.uid.toString(),
                          hintStyle: Globals.kHintStyle,
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Globals.kIconColor,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: snapshot.data?.age.toString(),
                          hintStyle: Globals.kHintStyle,
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Globals.kIconColor,
                          )),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen()));
                      await _auth.signOut();
                    },
                    child: const Text('Logout'),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size.fromWidth(250)),
                      backgroundColor: MaterialStateProperty.all(const Color(0xFFB20000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Color(0xFFB20000)))),
                      elevation: MaterialStateProperty.all(0),
                    ),
                  ),
                ],
              ),
            ),
          ));
        });
  }
}
