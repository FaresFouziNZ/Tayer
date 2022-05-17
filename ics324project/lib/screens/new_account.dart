import 'package:flutter/material.dart';
import 'package:ics324project/Firebase/auth.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/classes/prog_user.dart';
import 'package:ics324project/screens/main_screen.dart';
import 'package:ics324project/widgets/globals.dart';
import 'package:provider/provider.dart';

class NewAccountPage extends StatelessWidget {
  const NewAccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProgUser>(context);
    final AuthService _auth = AuthService();
    String fName = '', lName = '', age = '';
    return FutureBuilder(
        future: DatabaseService.instance.userById(user.uid),
        builder: (context, snapshop) {
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
                    child: CircleAvatar(backgroundImage: null, radius: 75),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (text) {
                        fName = text;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First Name',
                          hintStyle: Globals.kHintStyle,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Globals.kIconColor,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (text) {
                        lName = text;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name',
                          hintStyle: Globals.kHintStyle,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Globals.kIconColor,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (text) {
                        age = text;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Age',
                          hintStyle: Globals.kHintStyle,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Globals.kIconColor,
                          )),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (age.isEmpty || fName.isEmpty || lName.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text('Invalid input'),
                                  content: const Text('Please check your input'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Ok'))
                                  ],
                                ));
                      } else {
                        user.age = int.parse(age);
                        user.firstName = fName;
                        user.lastName = lName;
                        user.isAdmin = false;
                        await DatabaseService().updateUser(user: user);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                      }
                    },
                    child: const Text('Submit'),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size.fromWidth(250)),
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF18C0C1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Color(0xFF18C0C1)))),
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
