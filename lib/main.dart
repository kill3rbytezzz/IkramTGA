import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login/login.dart';
import 'dart:convert';
import 'main.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "TGA APP",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/main.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 10,
                      height: 550,
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        height: 70,
                        width: 200,
                        decoration: new BoxDecoration(
                            color: Color.fromARGB(255, 230, 230, 230),
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
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Login()));
                          },
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ])
                  ]),
            )));
  }
}
