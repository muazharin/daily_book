import 'package:flutter/material.dart';
import 'package:daily_book/model/optionlog.dart';
import 'package:daily_book/pages/login.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    switch (log) {
      case LoginStatus.isSignOut:
        return Login();
        break;
      case LoginStatus.isSignIn:
        return Scaffold(
          // floatingActionButton: ,
          body: Center(
            child: Text('Menu'),
          ),
        );
      default:
        return Container();
    }
  }
}
