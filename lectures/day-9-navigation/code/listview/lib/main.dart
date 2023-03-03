import 'package:flutter/material.dart';
import 'package:listview/second_screen.dart';
import 'package:listview/stack_widget.dart';

import 'grideview_widget.dart';

//Navugator
void main() {
  runApp(MyApp());
}

// Beamer or Go routeer

class Student {
  int roll = 0;
  String name = '';
  String surname = '';

  Student(this.roll, this.name, this.surname);
}

//fixme add seprate file for rout constants
const String second = '/second';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Student> studnetList = [
    Student(1, "Kusahal", "gupta"),
    Student(2, "Vishal", "Verma"),
    Student(3, "Rushali", "Patil"),
    Student(4, "Gaurav", "gupta"),
    Student(5, "Guravi", "Verma"),
    Student(6, "Kusahal", "Patil"),
    Student(8, "Kusahal", "gupta"),
    Student(2, "Vishal", "Verma"),
    Student(3, "Rushali", "Patil"),
    Student(4, "Gaurav", "gupta"),
    Student(5, "Guravi", "Verma"),
    Student(6, "Kusahal", "Patil"),
    Student(8, "Kusahal", "gupta"),
    Student(2, "Vishal", "Verma"),
    Student(3, "Rushali", "Patil"),
    Student(4, "Gaurav", "gupta"),
    Student(5, "Guravi", "Verma"),
    Student(6, "Kusahal", "Patil"),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: 'Flutter Demo Home Page',
              list: studnetList,
            ),
        second: (context) => SecondScreen(),
        '/third': (context) => SecondScreen(),
        '/fourth': (context) => SecondScreen(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.list});

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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: widget.list.length,
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              return ListTile(
                  title: Text(widget.list.elementAt(index).name),
                  subtitle: Text(widget.list.elementAt(index).surname),
                  leading: Icon(Icons.access_alarm),
                  onTap: () {
                    /*ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tapped on ${widget.list.elementAt(index).name}')));*/
                    Navigator.pushNamed(context, second, arguments: widget.list.elementAt(index));
                  });
            } else {
              return Column(
                children: [
                  Positioned(
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.green,
                      child: Text(widget.list.elementAt(index).name),
                    ),
                  ),
                ],
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
