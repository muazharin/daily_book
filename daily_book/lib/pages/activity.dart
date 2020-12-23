import 'package:daily_book/pages/activity_add.dart';
import 'package:daily_book/pages/activity_edit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily_book/model/optionlog.dart';
import 'package:daily_book/pages/login.dart';
import 'package:daily_book/pages/menu.dart';
import 'package:http/http.dart' as http;
import 'package:daily_book/model/baseurl.dart';
import 'dart:convert';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  String id = '';
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
      id = sp.getString('id');
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

  Future<List> _getRecentRequest() async {
    final source = await http.post(
      Baseurl.recentRequest,
      body: {"id": id, "daily-book-msal-key": key},
    );
    var data = json.decode(source.body);
    print(data['data']);
    return data['data'];
  }

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Exit"),
      content: Text("Are you sure want to exit?"),
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
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 48.0),
                                Expanded(
                                  child: FutureBuilder<List>(
                                      future: _getRecentRequest(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError)
                                          print(snapshot.error);
                                        return Center(
                                          child: snapshot.hasData
                                              ? new ItemList(
                                                  list: snapshot.data,
                                                )
                                              : new Center(
                                                  child:
                                                      new CircularProgressIndicator(),
                                                ),
                                        );
                                      }),
                                ),
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
                                    "http://mips.msalgroup.com/absensi_ho/assets/assets/avatars/muaz1.jpg"),
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
        padding: const EdgeInsets.only(bottom: 24.0, right: 16.0),
        child: FloatingActionButton(
          backgroundColor: Color(0xfffd8e00),
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

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    void _infoDetailRequest(String keterangan) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Info"),
            content: Text("Status : $keterangan"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok')),
            ],
          );
        },
      );
    }

    void _infoRequest(String pesan) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: Text("Info"),
            content: Text(pesan),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok')),
            ],
          );
        },
      );
    }

    _editActivity(String id, String foto, String keluhan) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ActivityEdit(id, foto, keluhan),
        ),
      );
    }

    _doDelete(String id, String foto) async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      var key = sp.getString('key');
      final source = await http.post(
        Baseurl.delRequest,
        body: {'daily-book-msal-key': key, 'id_activity': id, 'foto': foto},
      );
      var result = json.decode(source.body);
      _infoRequest(result['message']);
    }

    _deleteActivity(String id, String foto) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete'),
            content: Text('Do you want to delete this item?'),
            actions: [
              FlatButton(
                onPressed: () {
                  _doDelete(id, foto);
                  Navigator.of(context).pop();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Menu()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('Yes'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('No'),
              ),
            ],
          );
        },
      );
    }

    void _pilihOpsiActivity(String id, String foto, String keluhan) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Color(0xFF737373),
              height: 130.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Icon(Icons.edit_outlined),
                      title: Text('Edit'),
                      onTap: () => _editActivity(id, foto, keluhan),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.delete_forever_outlined),
                      title: Text('Delete'),
                      onTap: () => _deleteActivity(id, foto),
                    )
                  ],
                ),
              ),
            );
          });
    }

    return Container(
      child: new ListView.separated(
        itemBuilder: (context, ind) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => _infoDetailRequest(list[ind]['ket']),
                      onLongPress: () {
                        _pilihOpsiActivity(list[ind]['id_activity'],
                            list[ind]['foto'], list[ind]['keluhan']);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(Baseurl.ip +
                                      '/assets/images/request/' +
                                      list[ind]['foto']),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            // Text(list[ind]['keluhan']),
                            list[ind]['keluhan'].length <= 20
                                ? Text(list[ind]['keluhan'])
                                : Text(list[ind]['keluhan'].substring(0, 19) +
                                    '...'),
                            Spacer(),
                            Icon(
                              Icons.info_outline,
                              color: list[ind]['ket'] == 'waiting'
                                  ? Colors.amber
                                  : Colors.green,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, ind) => Divider(
          color: Colors.black26,
        ),
        itemCount: list == null ? 0 : list.length,
      ),
    );
  }
}
