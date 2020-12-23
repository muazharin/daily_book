import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:daily_book/model/baseurl.dart';
import 'package:daily_book/model/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily_book/model/optionlog.dart';
import 'package:daily_book/pages/menu.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username = '';
  String _password = '';
  final _key = new GlobalKey<FormState>();
  bool _validate = false;

  Widget _buildTopCard(double width, double height) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 8.0, right: 8.0, bottom: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 48.0),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 10.0, right: 8.0, bottom: 8.0),
            child: Row(
              children: <Widget>[
                Text(
                  'MSAL Group - Helpdesk App',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _showAlert(String message) {
    return AlertDialog(
      title: Text('Peringatan!'),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Ok'))
      ],
    );
  }

  Widget _buildLoginCard(
    double width,
    String _username,
    String _password,
  ) {
    login() async {
      if (_key.currentState.validate()) {
        _key.currentState.save();
        final response = await http.post(Baseurl.login, body: {
          'daily-book-msal-key': 'admin2020-11-06',
          'username': _username,
          'password': _password
        });
        var result = jsonDecode(response.body);
        bool status = result['status'];
        int value = result['value'];
        String message = result['message'];
        if (status) {
          String id = result['data'][0]['id_user'];
          String username = result['data'][0]['username'];
          String password = result['data'][0]['password'];
          String devisi = result['data'][0]['devisi'];
          String posisi = result['data'][0]['posisi'];
          String email = result['data'][0]['email'];
          String foto = result['data'][0]['foto'];
          String nohp = result['data'][0]['nohp'];
          String key = result['data'][0]['key'];
          setState(() {
            savePref(value, id, username, password, devisi, posisi, email, foto,
                nohp, key);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
              (Route<dynamic> route) => false,
            );
            print(value);
            print(id);
            print(username);
            print(password);
            print(devisi);
            print(posisi);
            print(email);
            print(foto);
            print(nohp);
            print(key);
          });
        } else {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => _showAlert(message));
        }
      }
    }

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Form(
            key: _key,
            autovalidate: _validate,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/account.png',
                  width: width / 3,
                ),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: valUser,
                    onSaved: (String val) {
                      _username = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Username", border: OutlineInputBorder())),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    validator: valPass,
                    onSaved: (String val) {
                      _password = val;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password", border: OutlineInputBorder())),
                SizedBox(
                  height: 16.0,
                ),
                InkWell(
                  onTap: login,
                  child: Container(
                    width: double.infinity,
                    height: 56.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1.0),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    ));
  }

  savePref(
      int value,
      String id,
      String username,
      String password,
      String devisi,
      String posisi,
      String email,
      String foto,
      String nohp,
      String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      sp.setInt('value', value);
      sp.setString('id', id);
      sp.setString('username', username);
      sp.setString('password', password);
      sp.setString('devisi', devisi);
      sp.setString('posisi', posisi);
      sp.setString('email', email);
      sp.setString('foto', foto);
      sp.setString('nohp', nohp);
      sp.setString('key', key);
    });
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
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      child: Align(
                    alignment: Alignment.topCenter,
                    child: _buildTopCard(width, height),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum memiliki akun? ',
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                              // onTap: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => Daftar()));
                              // },
                              child: Text('Hubungi Kami',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 108, 16, 16),
                child: Container(
                  child: _buildLoginCard(width, _username, _password),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
