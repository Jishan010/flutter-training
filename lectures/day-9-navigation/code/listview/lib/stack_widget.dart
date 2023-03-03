import 'package:flutter/material.dart';

import 'main.dart';

class MyStackPage extends StatefulWidget {
  const MyStackPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyStackPage> createState() => _MyStackState();
}

class _MyStackState extends State<MyStackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              height: 400,
              width: 400,
              color: Colors.green,
              child: Text('Item 1'),
            ),
          ),
          Container(
            height: 300,
            width: 300,
            color: Colors.red,
            child: Text('Item 1'),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.amber,
              child: Text('Item 1'),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.deepPurple,
            child: Text('Item 1'),
          ),
          Positioned(
            left: 50,
            top: 240,
            bottom: 20,
            right: 200,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.black,
              child: Text('Item 1'),
            ),
          )
        ],
      ),
    );
  }
}
