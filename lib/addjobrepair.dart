import 'addjobhosting.dart';
import 'job.dart';
import 'package:webfeed/domain/media/price.dart';

import '/listjob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';
import 'package:intl/intl.dart';

class addJobRepair extends StatefulWidget {
  @override
  _addJobRepair createState() => new _addJobRepair();
}

class _addJobRepair extends State<addJobRepair> {
  TextEditingController Costumername = TextEditingController();
  TextEditingController Laptop = TextEditingController();
  TextEditingController Type = TextEditingController();
  TextEditingController Problem = TextEditingController();
  TextEditingController DateTaken = TextEditingController();
  TextEditingController DateReturn = TextEditingController();
  TextEditingController Tecnician = TextEditingController();
  TextEditingController Price = TextEditingController();

  void StartAdding() {
    String url = "https://maulidi.gukgukcraft.id/temp/adddevice.php";

    http.post(Uri.parse(url), body: {
      "Costumername": Costumername.text,
      "Laptop": Laptop.text,
      "Type": Type.text,
      "Problem": Problem.text,
      "DateTaken": DateTaken.text,
      "DateReturn": DateReturn.text,
      "Technician": Tecnician.text,
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
                image: AssetImage("assets/addjobrepair.png"),
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
                    controller: Costumername,
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
                      "Merek Laptop *",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 230, 230, 230),
                      ),
                    ),
                    Text("            "),
                    Text(
                      "Tipe Laptop",
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
                        controller: Laptop,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.computer_rounded),
                          hintText: 'Merk Laptop',
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
                        controller: Type,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.type_specimen),
                          hintText: 'Optional',
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Kendala *",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                Text(
                    "                                                               ")
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
                    controller: Problem,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.sync_problem),
                      hintText: 'Masukkan Kendala',
                      hintStyle: TextStyle(
                          fontFamily: 'Montserrat', fontSize: 10, height: 2.4),
                    ),
                  )),
              Container(
                width: 10,
                height: 10,
                color: Color.fromARGB(0, 255, 0, 0),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("               "),
                Text(
                  "Tgl Pengambilan *",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                Text("      "),
                Text(
                  "Tgl Pengembalian *",
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
                        controller: DateTaken,
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
                              DateTaken.text =
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
                        controller: DateReturn,
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
                              DateReturn.text =
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Nama Teknisi *",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                Text("                                                    ")
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
                    controller: Tecnician,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person_add),
                      hintText: 'Masukkan Nama Teknisi',
                      hintStyle: TextStyle(
                          fontFamily: 'Montserrat', fontSize: 10, height: 2.4),
                    ),
                  )),
              Container(
                width: 10,
                height: 20,
                color: Color.fromARGB(0, 255, 0, 0),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Total Harga *",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                Text("                                                    ")
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
                    controller: Price,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.money_rounded),
                      hintText: 'Masukkan Total Harga (Rupiah)',
                      hintStyle: TextStyle(
                          fontFamily: 'Montserrat', fontSize: 10, height: 2.4),
                    ),
                  )),
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
