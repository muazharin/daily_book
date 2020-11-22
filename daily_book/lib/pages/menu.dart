import 'package:flutter/material.dart';
import 'package:daily_book/model/optionlog.dart';
import 'package:daily_book/pages/login.dart';
import './activity.dart' as activity;
import './rating.dart' as rating;
import './profile.dart' as profile;

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  // int _currentIndex = 0;
  List<Widget> _tabList = [
    new activity.Activity(),
    new rating.Rating(),
    new profile.Profile()
  ];
  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: _tabList.length);
    super.initState();
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
                  // text: 'Activity',
                ),
                new Tab(
                  icon: new Icon(Icons.star_rate, color: Colors.grey),
                  // text: 'Rating',
                ),
                new Tab(
                  icon: new Icon(Icons.assignment_ind_rounded,
                      color: Colors.grey),
                  // text: 'Profile',
                ),
              ],
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
