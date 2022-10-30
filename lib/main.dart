import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'listjob.dart';
import 'dart:convert';
import 'main.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "Device Monitoring",
    home: new Home(),
  ));
}

var username = "husnul";
var password = "husnula123";
var perms;

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPsw = TextEditingController();

  StartLogin() async {
    String url = "https://maulidi.gukgukcraft.id/temp/login.php";

    final response = await http.post(Uri.parse(url), body: {
      "username": controllerName.text,
      "password": controllerPsw.text
    });
    var jsondata = json.decode(response.body);
    perms = jsondata["message"];
    username = controllerName.text;
    password = controllerPsw.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Login.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Container(
                  width: 10,
                  height: 500,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Username",
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
                    width: 250,
                    height: 40,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 230, 230, 230),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0),
                        )),
                    child: TextField(
                      controller: controllerName,
                      decoration: InputDecoration(
                        // label: 'username',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'Type your username',
                        hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            height: 2.4),
                      ),
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
                      "Password",
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
                    width: 250,
                    height: 40,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 230, 230, 230),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0),
                        )),
                    child: TextField(
                      controller: controllerPsw,
                      decoration: InputDecoration(
                        // label: 'username',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'Type your password',
                        hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            height: 2.4),
                      ),
                    )),
                Container(
                  width: 10,
                  height: 30,
                  color: Color.fromARGB(0, 255, 0, 0),
                ),
                Container(
                  height: 35,
                  width: 150,
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 230, 230, 230),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0),
                        bottomLeft: const Radius.circular(10.0),
                        bottomRight: const Radius.circular(10.0),
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
                                  new ListJob()));
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
                      'Login',
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ])),
        ));
  }
}
