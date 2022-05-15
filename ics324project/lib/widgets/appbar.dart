import 'package:flutter/material.dart';

class AppBarDef extends StatefulWidget {
  const AppBarDef({Key key}) : super(key: key);

  @override
  State<AppBarDef> createState() => _AppBarDefState();
}

class _AppBarDefState extends State<AppBarDef> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
