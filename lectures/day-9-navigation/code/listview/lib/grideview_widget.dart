import 'package:flutter/material.dart';

import 'main.dart';

class MyDashBoardPage extends StatefulWidget {
  const MyDashBoardPage({super.key, required this.title, required this.list});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  final List<Student> list;

  @override
  State<MyDashBoardPage> createState() => _MyDashBoarState();
}

class _MyDashBoarState extends State<MyDashBoardPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
          padding: EdgeInsets.all(10.0),
          children:  List.generate(100, (index) =>  Container(
            margin: EdgeInsets.all(16.0),
            height: 200,
            padding: EdgeInsets.all(16.0),
            color: Colors.green,
            child: Text(widget.list.elementAt(0).name),
          ))
         /* itemCount: widget.list.length,
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                    title: Text(widget.list.elementAt(index).name),
                    subtitle: Text(widget.list.elementAt(index).surname),
                    leading: Icon(Icons.access_alarm),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Tapped on ${widget.list.elementAt(index).name}')));
                    }),
              );
            } else {
              return Container(
                margin: EdgeInsets.all(16.0),
                height: 200,
                padding: EdgeInsets.all(16.0),
                color: Colors.green,
                child: Text(widget.list.elementAt(index).name),
              );
            }
          }*/),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
