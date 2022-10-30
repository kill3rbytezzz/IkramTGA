// import 'dart:html';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listjob.dart';

void main() {
  runApp(new DetailJob());
}

class DetailJob extends StatefulWidget {
  List? list;
  int? index;
  DetailJob({this.index, this.list});
  @override
  _DetailJob createState() => _DetailJob();
}

class _DetailJob extends State<DetailJob> {
  void deleteData() {
    var url = "https://maulidi.gukgukcraft.id/temp/deletedata.php";
    http.post(Uri.parse(url),
        body: {'machineid': widget.list?[widget.index!]['deviceid']});
  }

  @override
  Widget build(BuildContext context) {
    var ramused = int.parse("${widget.list?[widget.index!]["ramused"]}");
    var ramavail = int.parse("${widget.list?[widget.index!]["ramavail"]}");
    int ramtotal = ramavail + ramused;
    String ramtotalvar = "Detected Ram = " + ramtotal.toString() + " GB";
    String hdd = "${widget.list?[widget.index!]["hddname"]}";
    List<String> hddarr = hdd.split(",");

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${widget.list?[widget.index!]["Name"]}",
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
        body: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            body: Column(children: <Widget>[
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 100.0,
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 90.0,
                      decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 230, 230, 230),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 20,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Icon(Icons.computer_outlined),
                              ],
                            ),
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            color: Color.fromARGB(0, 255, 255, 255),
                          ),
                          Container(
                            width: 400,
                            height: 15,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Text(
                                  "Detected CPU = ${widget.list?[widget.index!]["cpuname"]}",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat', fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 15,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Text(
                                  "CPU Temp = ${widget.list?[widget.index!]["cputemp"]} °C",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat', fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 15,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Text(
                                  "CPU Load = ${widget.list?[widget.index!]["cpuload"]}%",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat', fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 30.0,
                    height: 20.0,
                  ),
                  Container(
                      width: double.infinity,
                      height: 120.0,
                      decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 230, 230, 230),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          )),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              height: 20,
                              color: Color.fromARGB(0, 255, 255, 255),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 10,
                                    color: Color.fromARGB(0, 255, 255, 255),
                                  ),
                                  Icon(Icons.videogame_asset),
                                ],
                              ),
                            ),
                            Container(
                              width: 10,
                              height: 10,
                              color: Color.fromARGB(0, 255, 255, 255),
                            ),
                            Container(
                              width: 400,
                              height: 15,
                              color: Color.fromARGB(0, 255, 255, 255),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 10,
                                    color: Color.fromARGB(0, 255, 255, 255),
                                  ),
                                  Text(
                                    "Detected GPU = ${widget.list?[widget.index!]["gpuname"]}",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat', fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 400,
                              height: 15,
                              color: Color.fromARGB(0, 255, 255, 255),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 10,
                                    color: Color.fromARGB(0, 255, 255, 255),
                                  ),
                                  Text(
                                    "GPU Temp = ${widget.list?[widget.index!]["gputemp"]} °C",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat', fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 400,
                              height: 15,
                              color: Color.fromARGB(0, 255, 255, 255),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 10,
                                    color: Color.fromARGB(0, 255, 255, 255),
                                  ),
                                  Text(
                                    "GPU Load = ${widget.list?[widget.index!]["gpucore"]}%",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat', fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 400,
                              height: 15,
                              color: Color.fromARGB(0, 255, 255, 255),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 10,
                                    color: Color.fromARGB(0, 255, 255, 255),
                                  ),
                                  Text(
                                    "GPU Memory Usage = ${widget.list?[widget.index!]["gpumemory"]}%",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat', fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 400,
                              height: 15,
                              color: Color.fromARGB(0, 255, 255, 255),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 10,
                                    color: Color.fromARGB(0, 255, 255, 255),
                                  ),
                                  Text(
                                    "GPU Fan = ${widget.list?[widget.index!]["gpufanrpm"]} RPM (${widget.list?[widget.index!]["gpufan"]}%)",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat', fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            // Flexible(
                            //     child: Text(
                            //         "${widget.list?[widget.index!]["gpuname"]}",
                            //         textAlign: TextAlign.left))
                          ])),
                  Container(
                    width: 30,
                    height: 20,
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  Container(
                      width: double.infinity,
                      height: 90.0,
                      decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 230, 230, 230),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 20,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Icon(Icons.memory_outlined),
                              ],
                            ),
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            color: Color.fromARGB(0, 255, 255, 255),
                          ),
                          Container(
                            width: 400,
                            height: 15,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Text(
                                  ramtotalvar,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat', fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 15,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Text(
                                  "Ram Usage = ${widget.list?[widget.index!]["ramused"]} GB (${widget.list?[widget.index!]["ramload"]}%)",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat', fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 15,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Text(
                                  "Available Memory = ${widget.list?[widget.index!]["ramavail"]} GB",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat', fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                    width: 30,
                    height: 20,
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  Container(
                      width: double.infinity,
                      height: 120.0,
                      decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 230, 230, 230),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 20,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Icon(Icons.dns_outlined),
                              ],
                            ),
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            color: Color.fromARGB(0, 255, 255, 255),
                          ),
                          Container(
                            width: 400,
                            height: 15,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Text(
                                  "Harddisk",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat', fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 50,
                            color: Color.fromARGB(0, 255, 255, 255),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                ),
                                Container(
                                  width: 300,
                                  height: 50,
                                  color: Color.fromARGB(0, 255, 255, 255),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      for (var i = 0; i < hddarr.length; i++)
                                        Text(
                                          hddarr[i],
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                    width: 50,
                    height: 20,
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  Container(
                      width: 250,
                      height: 35.0,
                      decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 230, 230, 230),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(5.0),
                            topRight: const Radius.circular(5.0),
                            bottomLeft: const Radius.circular(5.0),
                            bottomRight: const Radius.circular(5.0),
                          )),
                      child: Column(children: [
                        Text(
                          "Last Updated",
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 12),
                        ),
                        Text(
                          "${widget.list?[widget.index!]["timestamp"]}",
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 12),
                        ),
                      ])),
                  Container(
                    width: 50,
                    height: 20,
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  Container(
                      width: 130.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 230, 230, 230),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(5.0),
                            topRight: const Radius.circular(5.0),
                            bottomLeft: const Radius.circular(5.0),
                            bottomRight: const Radius.circular(5.0),
                          )),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () async {
                          deleteData();
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text(
                                        'DELETE !',
                                        style:
                                            TextStyle(fontFamily: 'Montserrat'),
                                      ),
                                      content: Text(
                                        "Apakah kamu yaking ingin menghapus '${widget.list![widget.index!]['Name']}'",
                                        style:
                                            TextStyle(fontFamily: 'Montserrat'),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Tidak',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat'),
                                            )),
                                        ElevatedButton(
                                            onPressed: () {
                                              deleteData();
                                              Navigator.of(context)
                                                  .push(new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new ListJob(),
                                              ));
                                            },
                                            child: Text('Ya'))
                                      ],
                                    ));
                          });
                        },
                        child: Text(
                          'Hapus',
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Container(
                    width: 50,
                    height: 20,
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  Container(
                      width: 130.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 230, 230, 230),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(5.0),
                            topRight: const Radius.circular(5.0),
                            bottomLeft: const Radius.circular(5.0),
                            bottomRight: const Radius.circular(5.0),
                          )),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () async {
                          setState(() {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ListJob()));
                          });
                        },
                        child: Text(
                          'Refresh',
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ],
              )
            ])));
  }
}
