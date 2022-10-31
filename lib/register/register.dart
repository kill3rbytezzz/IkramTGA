import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'registergeneral.dart';

void main() {
  runApp(new MaterialApp(
    title: "Device Monitoring",
    home: new Register(),
  ));
}

class Register extends StatefulWidget {
  @override
  _Register createState() => new _Register();
}

// Handling Text Input
class _Register extends State<Register> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerBirthday = TextEditingController();
  TextEditingController controllerGender = TextEditingController();

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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Container(
                  width: 10,
                  height: 150,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                Container(
                  width: 330,
                  height: 30,
                  color: Color.fromARGB(0, 255, 255, 255),
                  child: Text(
                    "What's Your E-Mail",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  width: 10,
                  height: 20,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                Container(
                    width: 330,
                    height: 50,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(
                            color: Color.fromARGB(255, 254, 202, 10)),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(75.0),
                          topRight: const Radius.circular(75.0),
                          bottomLeft: const Radius.circular(75.0),
                          bottomRight: const Radius.circular(75.0),
                        )),
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          height: 20,
                          color: Color.fromARGB(0, 255, 255, 255),
                        ),
                        Container(
                          width: 200,
                          height: 60,
                          color: Color.fromARGB(0, 0, 0, 0),
                          child: TextField(
                            controller: controllerEmail,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'E-Mail',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 15,
                                  height: 2.4),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  width: 10,
                  height: 15,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 5,
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                    Text(
                      "When were you born?",
                      style: TextStyle(
                        fontSize: 15,
                        // fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 15,
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                    Text(
                      "Let's find out how old you are.",
                      style: TextStyle(
                        fontSize: 15,
                        // fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      color: Color.fromARGB(0, 255, 255, 255),
                    )
                  ],
                ),
                Container(
                  width: 10,
                  height: 20,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                Container(
                    width: 330,
                    height: 50,
                    decoration: new BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 254, 202, 10)),
                        color: Color.fromARGB(0, 230, 230, 230),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(75.0),
                          topRight: const Radius.circular(75.0),
                          bottomLeft: const Radius.circular(75.0),
                          bottomRight: const Radius.circular(75.0),
                        )),
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          height: 20,
                          color: Color.fromARGB(0, 255, 255, 255),
                        ),
                        Container(
                          width: 200,
                          height: 60,
                          color: Color.fromARGB(0, 0, 0, 0),
                          child: TextField(
                            controller: controllerBirthday,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'Birthday',
                              hintStyle: TextStyle(
                                  // fontFamily: 'Montserrat',
                                  // fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 15,
                                  height: 2.4),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  width: 25,
                  height: 20,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                Container(
                    width: 330,
                    height: 50,
                    decoration: new BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 254, 202, 10)),
                        color: Color.fromARGB(0, 230, 230, 230),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(75.0),
                          topRight: const Radius.circular(75.0),
                          bottomLeft: const Radius.circular(75.0),
                          bottomRight: const Radius.circular(75.0),
                        )),
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          height: 20,
                          color: Color.fromARGB(0, 255, 255, 255),
                        ),
                        Container(
                          width: 200,
                          height: 60,
                          color: Color.fromARGB(0, 0, 0, 0),
                          child: TextField(
                            controller: controllerGender,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'Gender',
                              hintStyle: TextStyle(
                                  // fontFamily: 'Montserrat',
                                  // fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 15,
                                  height: 2.4),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  width: 10,
                  height: 40,
                  color: Color.fromARGB(0, 255, 0, 0),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 25,
                      height: 10,
                      color: Color.fromARGB(0, 255, 0, 0),
                    ),
                    Text(
                      "DOSEN",
                      style: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(0, 254, 202, 10),
                          fontSize: 17,
                          height: 0),
                    ),
                  ],
                ),
                Container(
                  width: 25,
                  height: 20,
                  color: Color.fromARGB(0, 255, 0, 0),
                ),
                Container(
                  height: 50,
                  width: 150,
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
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new Registergeneral()));
                      });
                    },
                    child: Text(
                      'Next',
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
