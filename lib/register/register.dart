import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';

void main() {
  runApp(new MaterialApp(
    title: "Device Monitoring",
    home: new Register(),
  ));
}

var username = "husnul";
var password = "husnula123";
var perms;

class Register extends StatefulWidget {
  @override
  _Register createState() => new _Register();
}

// Handling Text Input
class _Register extends State<Register> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPsw = TextEditingController();
  // Backend PHP
  StartLogin() async {
    String url = "http://localhost/login.php";

    // Manggil Value Database

    final response = await http.post(Uri.parse(url), body: {
      "username": controllerName.text,
      "password": controllerPsw.text
    });
    var jsondata = json.decode(response.body);
    perms = jsondata["message"];
    username = controllerName.text;
    password = controllerPsw.text;
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
                  height: 100,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                Container(
                  width: 330,
                  height: 30,
                  color: Color.fromARGB(0, 255, 255, 255),
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 254, 202, 10),
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
                            controller: controllerName,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 254, 202, 10),
                                  fontSize: 15,
                                  height: 2.4),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  width: 10,
                  height: 5,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 230, 230, 230),
                          fontWeight: FontWeight.bold),
                    ),
                    Text("                                                ")
                  ],
                ),
                Container(
                  width: 10,
                  height: 5,
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
                            controller: controllerPsw,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 254, 202, 10),
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
                          color: Color.fromARGB(255, 254, 202, 10),
                          fontSize: 17,
                          height: 0),
                    ),
                    Container(
                      width: 60,
                      height: 10,
                      color: Color.fromARGB(0, 255, 0, 0),
                    ),
                    Text(
                      "MAHASISWA/I",
                      style: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 202, 10),
                          fontSize: 17,
                          height: 0),
                    )
                  ],
                ),
                Container(
                  width: 25,
                  height: 20,
                  color: Color.fromARGB(0, 255, 0, 0),
                ),
                Container(
                  height: 50,
                  width: 300,
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
                      // await StartLogin();
                      perms = "true";
                      setState(() {
                        if (perms == "true") {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new Register()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text('Username Atau Password Salah'),
                                    content: Text(
                                        "Username Atau Password yang anda masukkan salah"),
                                  ));
                        }
                      });
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 25,
                  height: 20,
                  color: Color.fromARGB(0, 255, 0, 0),
                ),
                Text(
                  "Or",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 25,
                  height: 30,
                  color: Color.fromARGB(0, 255, 0, 0),
                ),
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        children: <TextSpan>[
                      TextSpan(text: "Don't have an Account? "),
                      TextSpan(
                          text: "Create Account",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Color.fromARGB(255, 254, 202, 10),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Register()));
                            })
                    ]))
              ])),
        ));
  }
}
