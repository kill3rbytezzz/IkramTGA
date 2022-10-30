import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'job.dart';
import 'main.dart';
import 'dart:convert';
import 'dart:async';
import 'addjobrepair.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "Device Monitoring",
    home: new ListJob(),
  ));
}

class ListJob extends StatefulWidget {
  @override
  _ListJob createState() => _ListJob();
}

class _ListJob extends State<ListJob> {
  StreamController<Map<String, dynamic>> _streamController = StreamController();
  Timer? _timer;
  Future<List> getData() async {
    var response = await http.post(
        Uri.parse("https://maulidi.gukgukcraft.id/temp/getdata.php"),
        body: {"username": username, "password": password});
    return json.decode(response.body);
  }

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) => getData());

    super.initState();
  }

  @override
  void dispose() {
    if (_timer!.isActive) _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/ListJob.png"), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                backgroundColor: Color.fromARGB(100, 51, 51, 51),
                title: Text(
                  "List Job",
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          ).then((value) => setState(() {}));
                        },
                        child: Icon(
                          Icons.logout,
                          size: 26.0,
                        ),
                      )),
                ]),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Color.fromARGB(200, 174, 65, 64),
                child: Icon(Icons.add),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => addJobRepair()),
                    ).then((value) => setState(() {}))),
            body: FutureBuilder<List>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? new DeviceList(
                        list: snapshot.data,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            )));
  }
}

class DeviceList extends StatelessWidget {
  final List? list;
  DeviceList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return Container(
              padding: const EdgeInsets.all(0.3),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => DetailJob(
                          list: list ?? [],
                          index: i,
                        ))),
                child: Card(
                  // elevation: 7,
                  color: Color.fromARGB(200, 174, 65, 64),
                  child: ListTile(
                    // tileColor: Color.fromARGB(100, 174, 65, 64),
                    title: Text(
                      list![i]["Name"],
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    leading: Icon(Icons.cases_outlined),
                    subtitle: Text(
                      "MachineID : ${list![i]['machineid']}",
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ));
        });
  }
}
