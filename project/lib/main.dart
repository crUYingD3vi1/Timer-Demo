import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'show_code.dart';
import 'dart:convert';

class PictureInfo{
  final String id;
  final String name;
  final String score;


  PictureInfo({this.id, this.name, this.score,});

  factory PictureInfo.fromJson(Map<String, dynamic> json) {
    return PictureInfo(
      id: json['id'],
      name: json['name'],
      score: json['url'],
    );
  }
}


class TestHttp extends StatefulWidget {
  final String url;



  TestHttp({String url}) : url = url;

  @override
  State<StatefulWidget> createState() => TestHttpState();
} // TestHttp

class TestHttpState extends State<TestHttp> {
  String _url;
  PictureInfo _pictureInfo;

  @override
  void initState() {
    _url = widget.url;
    super.initState();
  } //initState

  _sendRequestGet() {
    //update form data
    http.get(_url).then((response) {
      _pictureInfo = PictureInfo.fromJson(json.decode(response.body));

      setState(() {}); //reBuildWidget
    }).catchError((error) {
      _pictureInfo = PictureInfo(
        id: '',
        name: error.toString(),
        score: '',
      );

      setState(() {}); //reBuildWidget
    });
  } //_sendRequestGet

  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        SizedBox(height: 20.0),

        SizedBox(height: 20.0),
        Text(_pictureInfo == null ? '' :_pictureInfo.date,
            style: TextStyle(fontSize: 15, color: Colors.green)),
        SizedBox(height: 10),
        Text(_pictureInfo == null ? '' :_pictureInfo.title,
            style: TextStyle(fontSize: 20.0, color: Colors.blue)),
        SizedBox(height: 10),
        Image.network(_pictureInfo == null ? '' :_pictureInfo.url),
        SizedBox(height: 10),
        Text(_pictureInfo == null ? '' :_pictureInfo.description),
      ],
    )));
  } //build
} //TestHttpState

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test HTTP API'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.code),
                tooltip: 'Code',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CodeScreen()));
                })
          ],
        ),
        body: TestHttp(
            url: 'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY'));
  }
}

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
