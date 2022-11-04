import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'registergeneral.dart';
import 'package:intl/intl.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "Device Monitoring",
//     home: new Register(),
//   ));
// }

var Email;
var Birthday;
var Gender;

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
    Email = controllerEmail.text;
    Birthday = controllerBirthday.text;
    Gender = controllerGender.text;
  }

  @override
  void initState() {
    controllerBirthday.text = '';
    super.initState();
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
                            controller: Email,
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
                            readOnly:
                                true, //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  controllerBirthday.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
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
                            controller: Gender,
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
                        if (Email == "" || Birthday == "" || Gender == "") {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text('Data Belum Lengkap'),
                                    content:
                                        Text("Pastikan Data Sudah Lengkap"),
                                  ));
                        } else {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new Registergeneral()));
                        }
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
