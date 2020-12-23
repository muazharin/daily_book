import 'package:flutter/material.dart';
import 'package:daily_book/model/optionlog.dart';
import 'package:daily_book/pages/login.dart';
import './activity.dart' as activity;
import './rating.dart' as rating;
import './profile.dart' as profile;
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  List<Widget> _tabList = [
    new activity.Activity(),
    new rating.Rating(),
    new profile.Profile()
  ];
  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: _tabList.length);
    getPref();
    super.initState();
  }

  var value;
  getPref() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      value = sp.getInt('value');
      log = value == 1 ? LoginStatus.isSignIn : LoginStatus.isSignOut;
    });
    print(log);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (log) {
      case LoginStatus.isSignOut:
        return Login();
        break;
      case LoginStatus.isSignIn:
        return Scaffold(
          body: new TabBarView(controller: controller, children: _tabList),
          bottomNavigationBar: new Material(
            child: new TabBar(
              controller: controller,
              tabs: [
                new Tab(
                  icon: new Icon(Icons.article, color: Colors.grey),
                ),
                new Tab(
                  icon: new Icon(Icons.star_rate, color: Colors.grey),
                ),
                new Tab(
                  icon: new Icon(Icons.assignment_ind_rounded,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        );
        break;
      default:
        return Container();
        break;
    }
  }
}
