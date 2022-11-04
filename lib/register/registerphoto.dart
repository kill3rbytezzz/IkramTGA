import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'registergeneral.dart';
import 'dart:io';
import '../login/login.dart';
import 'package:image_picker/image_picker.dart';
import 'test.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "Device Monitoring",
//     home: new RegisterPhoto(),
//   ));
// }

class RegisterPhoto extends StatefulWidget {
  @override
  _RegisterPhoto createState() => new _RegisterPhoto();
}

// Handling Text Input
class _RegisterPhoto extends State<RegisterPhoto> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerBirthday = TextEditingController();
  TextEditingController controllerGender = TextEditingController();

  XFile? file;
  String status = '';
  late String base64Imagel;
  late File tmpFile;
  String errMessage = 'Error Uploading Image';
  final ImagePicker picker = ImagePicker();

  Future chooseImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      file = img;
    });
  }

  // Backend PHP
  StartLogin() async {
    String url = "http://localhost/login.php";

    // Manggil Value Database

    final response = await http.post(Uri.parse(url), body: {
      "username": controllerEmail.text,
      "password": controllerBirthday.text,
      "gender": controllerGender.text
    });
    var jsondata = json.decode(response.body);
  }

// Widget Layar
  @override
  Widget build(BuildContext context) {
    // Container Background (Background putih doang loginnya)
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                Container(
                  width: 200,
                  height: 30,
                  color: Color.fromARGB(0, 0, 0, 255),
                  child: Text(
                    "Upload Your Photo",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 10,
                  height: 50,
                  color: Color.fromARGB(0, 0, 0, 255),
                ),
                Container(
                  width: 300,
                  height: 400,
                  decoration: new BoxDecoration(
                    color: Color.fromARGB(0, 255, 255, 255),
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0), width: 2),
                  ),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: () async {
                        chooseImage(ImageSource.gallery);
                      },
                      child: file != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  //to show image, you type like this.
                                  File(file!.path),
                                  fit: BoxFit.cover,
                                  width: 300,
                                  height: 400,
                                ),
                              ),
                            )
                          : Text(
                              "No Image",
                              style: TextStyle(fontSize: 20),
                            )),
                ),
                Container(
                  width: 10,
                  height: 50,
                  color: Color.fromARGB(0, 0, 0, 255),
                ),
                Container(
                  height: 50,
                  width: 200,
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 254, 202, 10),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(75.0),
                        topRight: const Radius.circular(75.0),
                        bottomLeft: const Radius.circular(75.0),
                        bottomRight: const Radius.circular(75.0),
                      )),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () async {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                    title: Text('Berhasil Mendaftar'),
                                    content: Text(
                                        "Anda telah berhasil Mendaftar, silahkan tunggu proses verifikasi"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                new MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        new Login()));
                                          },
                                          child: Text(
                                            'Ok',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat'),
                                          )),
                                    ]));
                      });
                    },
                    child: Text(
                      'Selesai',
                      style: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ])),
        ));
  }
}
