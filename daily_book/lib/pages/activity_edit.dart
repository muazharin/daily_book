import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as Img;
import 'dart:math' as Math;
import 'package:path_provider/path_provider.dart';
import 'package:daily_book/model/validation.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:daily_book/model/baseurl.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

class ActivityEdit extends StatefulWidget {
  final String id;
  final String foto;
  final String keluhan;
  const ActivityEdit(this.id, this.foto, this.keluhan);
  @override
  _ActivityEditState createState() => _ActivityEditState();
}

class _ActivityEditState extends State<ActivityEdit> {
  final _keySend = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _validateSend = false;
  File _image;
  String message = '';
  String key = '';

  getPref() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      key = sp.getString('key');
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int rand = new Math.Random().nextInt(100000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 500);

    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      Navigator.pop(context);
      _image = compressImg;
    });
  }

  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int rand = new Math.Random().nextInt(100000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 500);

    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      Navigator.pop(context);
      _image = compressImg;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _pilihOpsiGambar() {
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
                children: [
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text('Gallery'),
                    onTap: () => getImageGallery(),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Camera'),
                    onTap: () => getImageCamera(),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    void showInSnackBar(String value) {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value),
        backgroundColor: Colors.green,
      ));
    }

    void showInSnackBarErr(String value) {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value),
        backgroundColor: Colors.red,
      ));
    }

    _submitEditRequest() async {
      if (_keySend.currentState.validate()) {
        _keySend.currentState.save();
        if (_image == null) {
          final response = await http.post(Baseurl.submitEditRequest, body: {
            'daily-book-msal-key': key,
            'keluhan': message,
            'id_act': widget.id
          });
          var result = jsonDecode(response.body);
          if (result['status']) {
            showInSnackBar('Request updated succesfully!');
            setState(() {
              _image = null;
              _keySend.currentState.reset();
            });
          } else {
            showInSnackBarErr('Request failed to update!');
          }
        } else {
          try {
            var stream =
                http.ByteStream(DelegatingStream.typed(_image.openRead()));
            var length = await _image.length();
            var uri = Uri.parse(Baseurl.submitEditRequest);
            var request = http.MultipartRequest("POST", uri);
            request.fields['keluhan'] = message;
            request.fields['id_act'] = '' + widget.id + '';
            request.fields['daily-book-msal-key'] = key;
            request.files.add(http.MultipartFile("foto", stream, length,
                filename: path.basename(_image.path)));
            var response = await request.send();
            if (response.contentLength != 2) {
              showInSnackBar('Request sent succesfully!');
              setState(() {
                _image = null;
                _keySend.currentState.reset();
              });
            } else {
              showInSnackBarErr('Request failed to send!');
            }
          } catch (e) {
            debugPrint('Error debug : $e');
          }
        }
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      color: Color(0xff00f6fe),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16.0),
                          bottomLeft: Radius.circular(16.0)),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Text(
                              'REQUEST',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MSAL Group Apps',
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.copyright),
                      Text('by MIS',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 0.0),
            child: Card(
              child: Container(
                height: 500.0,
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _keySend,
                  autovalidate: _validateSend,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: _pilihOpsiGambar,
                        child: Center(
                          child: _image == null
                              ? Image.network(
                                  Baseurl.ip +
                                      '/assets/images/request/' +
                                      widget.foto,
                                  height: 200.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover)
                              : Image.file(
                                  _image,
                                  height: 200.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        initialValue: '' + widget.keluhan + '',
                        validator: valMessage,
                        maxLines: 6,
                        onSaved: (String val) {
                          message = val;
                        },
                        decoration: InputDecoration(
                            labelText: 'Message', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 16.0),
                      InkWell(
                        onTap: _submitEditRequest,
                        child: Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                              color: Color(0xfffd8e00),
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
