import 'package:daily_book/pages/activity_add.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily_book/model/optionlog.dart';
import 'package:daily_book/pages/login.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  String username = '';
  String password = '';
  String devisi = '';
  String posisi = '';
  String email = '';
  String foto = '';
  String nohp = '';
  String key = '';
  logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      sp.setInt('value', null);
      sp.setString('id', null);
      sp.setString('username', null);
      sp.setString('password', null);
      sp.setString('devisi', null);
      sp.setString('posisi', null);
      sp.setString('email', null);
      sp.setString('foto', null);
      sp.setString('nohp', null);
      sp.setString('key', null);
    });
  }

  var value;
  getPref() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      value = sp.getInt('value');
      log = value == 1 ? LoginStatus.isSignIn : LoginStatus.isSignOut;
      username = sp.getString('username');
      password = sp.getString('password');
      devisi = sp.getString('devisi');
      posisi = sp.getString('posisi');
      email = sp.getString('email');
      foto = sp.getString('foto');
      nohp = sp.getString('nohp');
      key = sp.getString('key');
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Keluar?"),
      content: Text("Anda yakin ingin keluar?"),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No')),
        FlatButton(
            onPressed: () {
              logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false,
              );
            },
            child: Text('Yes'))
      ],
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background2.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('ACTIVITY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
                        child: Icon(
                          Icons.exit_to_app,
                          size: 32.0,
                          color: Colors.amber,
                        ))
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 64.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 48.0),
                                // Text('1. Activity 1'),
                                // Text('2. Activity 2'),
                                // Text('3. Activity 3'),
                                Spacer(),
                                RaisedButton(
                                  onPressed: () {},
                                  color: Color(0xfffd8e00),
                                  child: InkWell(
                                    onTap: null,
                                    child: Container(
                                      width: double.infinity,
                                      height: 56.0,
                                      decoration: BoxDecoration(
                                          color: Color(0xfffd8e00),
                                          borderRadius:
                                              BorderRadius.circular(4.0)),
                                      child: Center(
                                        child: Text(
                                          "Selengkapnya",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              letterSpacing: 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "http://192.168.1.231/absensi_ho/assets/assets/avatars/muaz1.jpg"),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                username,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              SizedBox(height: 8.0),
                              Text(email),
                              // Row(
                              //   children: [
                              //     Text('4.5 '),
                              //     Icon(Icons.star, color: Colors.amber),
                              //   ],
                              // )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: FloatingActionButton(
          onPressed: () {
            print('pindah page');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ActivityAdd()),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
