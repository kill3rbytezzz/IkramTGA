import 'dart:convert';

import 'addjobhosting.dart';
import 'job.dart';
import 'addjobrepair.dart';
import '/listjob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class addJobHosting extends StatefulWidget {
  @override
  _addJobHosting createState() => new _addJobHosting();
}

class _addJobHosting extends State<addJobHosting> {
  TextEditingController CostumerName = TextEditingController();
  TextEditingController HostingPackage = TextEditingController();
  TextEditingController Duration = TextEditingController();
  TextEditingController datestart = TextEditingController();
  TextEditingController dateend = TextEditingController();
  TextEditingController Price = TextEditingController();

  XFile? image;
  List _images = [];
  final ImagePicker picker = ImagePicker();

  Future sendImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    var uri = "localhsot/create.php";
    var request = http.MultipartRequest('POST', Uri.parse(uri));

    if (img != null) {
      var pic = await http.MultipartFile.fromPath("image", img.path);

      request.files.add(pic);

      await request.send().then((result) {
        http.Response.fromStream(result).then((response) {
          var message = jsonDecode(response.body);
          final snackBar = SnackBar(content: Text(message['message']));
          getImageServer();
        });
      }).catchError((e) {
        print(e);
      });
    }
  }

  Future getImageServer() async {
    try {
      final response = await http.get(Uri.parse('localhost/list.php'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _images = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    datestart.text = "";
    dateend.text = ""; //set the initial value of text field
    super.initState();
    getImageServer();
  }

  void StartAdding() {
    String url = "https://maulidi.gukgukcraft.id/temp/adddevice.php";

    http.post(Uri.parse(url), body: {
      "CostumerName": CostumerName.text,
      "Package": HostingPackage.text,
      "Duration": Duration.text,
      "Datestart": datestart,
      "Dateend": dateend.text,
      "Price": Price.text,
      "username": username,
      "password": password,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/addjobhosting.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              Container(
                color: Color.fromARGB(0, 255, 255, 255),
                width: 100.0,
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.0,
                    height: 30.0,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(200, 174, 65, 64),
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
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new addJobRepair()));
                      },
                      child: Text(
                        'Hardware & Repair',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(0, 255, 255, 255),
                    width: 10.0,
                    height: 10.0,
                  ),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(200, 174, 65, 64),
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
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new addJobHosting()));
                      },
                      child: Text(
                        'Hosting',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 30,
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Nama Pelanggan *",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                Text("                                            ")
              ]),
              Container(
                width: 10,
                height: 5,
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              Container(
                  width: 300,
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
                    controller: CostumerName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Masukkan Nama Pelanggan',
                      hintStyle: TextStyle(
                          fontFamily: 'Montserrat', fontSize: 10, height: 2.4),
                    ),
                  )),
              Container(
                width: 10,
                height: 10,
                color: Color.fromARGB(0, 255, 0, 0),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("               "),
                    Text(
                      "Paket Hosting *",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 230, 230, 230),
                      ),
                    ),
                    Text("            "),
                    Text(
                      "Durasi *",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 230, 230, 230),
                      ),
                    )
                  ]),
              Container(
                width: 10,
                height: 5,
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 145,
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
                        controller: HostingPackage,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.web),
                          hintText: 'Paket Hosting',
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10,
                              height: 2.4),
                        ),
                      )),
                  Container(
                    width: 10,
                    height: 10,
                    color: Color.fromARGB(0, 255, 0, 0),
                  ),
                  Container(
                      width: 145,
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
                        controller: Duration,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.date_range_sharp),
                          hintText: 'Durasi',
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10,
                              height: 2.4),
                        ),
                      )),
                ],
              ),
              Container(
                width: 10,
                height: 10,
                color: Color.fromARGB(0, 255, 0, 0),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("               "),
                Text(
                  "Tgl Mulai *",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                Text("                       "),
                Text(
                  "Expired *",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                )
              ]),
              Container(
                width: 10,
                height: 5,
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 145,
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
                        controller: datestart,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Color.fromARGB(255, 126, 126, 126),
                          ),
                          hintText: 'Date',
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10,
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
                              datestart.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      )),
                  Container(
                    width: 10,
                    height: 10,
                    color: Color.fromARGB(0, 255, 0, 0),
                  ),
                  Container(
                      width: 145,
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
                        controller: dateend,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.date_range),
                          hintText: 'Date',
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10,
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
                              dateend.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      )),
                ],
              ),
              Container(
                width: 10,
                height: 10,
                color: Color.fromARGB(0, 255, 0, 0),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("               "),
                Text(
                  "Total Harga *",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                Text("                  "),
                Text(
                  "Bukti",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                )
              ]),
              Container(
                width: 10,
                height: 5,
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    width: 145,
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
                      controller: Price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.money_rounded),
                        hintText: 'Masukkan Total Harga (Rupiah)',
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
                Container(
                    width: 145,
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
                      controller: Price,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.image),
                        hintText: 'Gambar',
                        hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            height: 2.4),
                      ),
                      onTap: () async {},
                    ))
              ]),
              Container(
                width: 10,
                height: 20,
                color: Color.fromARGB(0, 255, 0, 0),
              ),
              Container(
                height: 35,
                width: 150,
                decoration: new BoxDecoration(
                    color: Color.fromARGB(200, 174, 65, 64),
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
                    StartAdding();
                    await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                title: Text('Done !'),
                                content: Text("Job Berhasil Ditambahkan"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ListJob()),
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Text('Oke'))
                                ]));
                  },
                  child: Text(
                    'Tambahkan',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 10,
                height: 20,
                color: Color.fromARGB(0, 255, 0, 0),
              ),
              Container(
                height: 35,
                width: 150,
                decoration: new BoxDecoration(
                    color: Color.fromARGB(200, 174, 65, 64),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListJob()),
                    ).then((value) => setState(() {}));
                  },
                  child: Text(
                    'Batalkan',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ]))));
  }
}
