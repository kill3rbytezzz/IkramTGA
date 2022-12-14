import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ikramtga/login/login.dart';
import 'register.dart';
import 'registerphoto.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "Device Monitoring",
//     home: new Registergeneral(),
//   ));
// }

class Registergeneral extends StatefulWidget {
  @override
  _Registergeneral createState() => new _Registergeneral();
}

// Handling Text Input
class _Registergeneral extends State<Registergeneral> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerHp = TextEditingController();
  bool checkdosen = false;
  bool checkmahas = false;
  Color transparant = Color.fromARGB(0, 255, 255, 255);
  Color pnl = Color.fromARGB(255, 254, 202, 10);

  // Backend PHP
  StartRegister() async {
    String url = "http://localhost/register.php";

    // Manggil Value Database

    final response = await http.post(Uri.parse(url), body: {
      "email": Email,
      "birthday": Birthday,
      "gender": Gender,
      "nama": controllerName.text,
      "alamat": controllerAlamat.text,
      "id": controllerId.text,
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "NoHp": controllerHp.text
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
                  height: 120,
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
                              hintText: 'Nama',
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
                            controller: controllerAlamat,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'Alamat',
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
                            controller: controllerId,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'NIP/NIM',
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
                            controller: controllerUsername,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'Username',
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
                            controller: controllerPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'Password',
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
                            controller: controllerHp,
                            decoration: InputDecoration(
                              // label: 'username',
                              border: InputBorder.none,
                              hintText: 'No Hp',
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
                  height: 20,
                  color: Color.fromARGB(0, 255, 0, 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: pnl),
                        child: Checkbox(
                            checkColor: pnl,
                            value: checkdosen,
                            onChanged: (bool? value) {
                              setState(() {
                                checkdosen = value!;
                                checkmahas = false;
                              });
                            })),
                    Text(
                      "DOSEN",
                      style: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          height: 0),
                    ),
                    Container(
                      width: 70,
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
                                checkdosen = false;
                              });
                            })),
                    Text(
                      "MAHASISWA/I",
                      style: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
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
                        if (controllerAlamat.text == "" ||
                            controllerHp.text == "" ||
                            controllerId.text == "" ||
                            controllerName.text == "" ||
                            controllerPassword.text == "" ||
                            controllerUsername.text == "" ||
                            checkdosen == false && checkmahas == false) {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text('Data Belum Lengkap'),
                                    content:
                                        Text("Pastikan Data Sudah Lengkap"),
                                  ));
                        } else if (controllerAlamat.text == "" ||
                            controllerHp.text != "" &&
                                controllerId.text != "" &&
                                controllerName.text != "" &&
                                controllerPassword.text != "" &&
                                controllerUsername.text != "" &&
                                checkdosen == true &&
                                checkmahas == false) {
                          StartRegister();
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
                        } else {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new RegisterPhoto()));
                          // Navigator.of(context).pop(new MaterialPageRoute(
                          //     builder: (BuildContext context) =>
                          //         new Registergeneral()));
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
