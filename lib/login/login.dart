import 'package:flutter/material.dart';
import 'dart:convert';
import '/register/register.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';

void main() {
  runApp(new MaterialApp(
    title: "Device Monitoring",
    home: new Login(),
  ));
}

var username = "husnul";
var password = "husnula123";
var perms;

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

// Handling Text Input
class _Login extends State<Login> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPsw = TextEditingController();
  bool checkdosen = false;
  bool checkmahas = false;
  Color transparant = Color.fromARGB(0, 255, 255, 255);
  Color pnl = Color.fromARGB(255, 254, 202, 10);

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
                  color: transparant,
                ),
                Container(
                  width: 330,
                  height: 30,
                  color: transparant,
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: pnl,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  width: 10,
                  height: 20,
                  color: transparant,
                ),
                Container(
                    width: 330,
                    height: 50,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(color: pnl),
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
                          color: transparant,
                        ),
                        Container(
                          width: 200,
                          height: 60,
                          color: transparant,
                          child: TextField(
                            controller: controllerName,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: pnl,
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
                  color: transparant,
                ),
                Container(
                    width: 330,
                    height: 50,
                    decoration: new BoxDecoration(
                        border: Border.all(color: pnl),
                        color: transparant,
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
                          color: transparant,
                        ),
                        Container(
                          width: 200,
                          height: 60,
                          color: transparant,
                          child: TextField(
                            controller: controllerPsw,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: pnl,
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
                  color: transparant,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 25,
                      height: 10,
                      color: transparant,
                    ),
                    Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: pnl),
                        child: Checkbox(
                            checkColor: pnl,
                            value: checkdosen,
                            onChanged: (bool? value) {
                              setState(() {
                                checkdosen = value!;
                              });
                            })),
                    Text(
                      "DOSEN",
                      style: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: pnl,
                          fontSize: 17,
                          height: 0),
                    ),
                    Container(
                      width: 60,
                      height: 10,
                      color: transparant,
                    ),
                    Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: pnl),
                        child: Checkbox(
                            checkColor: pnl,
                            value: checkmahas,
                            onChanged: (bool? value) {
                              setState(() {
                                checkmahas = value!;
                              });
                            })),
                    Text(
                      "MAHASISWA/I",
                      style: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: pnl,
                          fontSize: 17,
                          height: 0),
                    )
                  ],
                ),
                Container(
                  width: 25,
                  height: 20,
                  color: transparant,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: new BoxDecoration(
                      color: pnl,
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
                              builder: (BuildContext context) => new Login()));
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
                  color: transparant,
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
                  color: transparant,
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
                            color: pnl,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Register()));
                            })
                    ]))
              ])),
        ));
  }
}
