import 'package:day_7_view_component_container/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: HomeScreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        leading: Icon(Icons.arrow_back),
        actions: [
          GestureDetector(child: Icon(Icons.more_horiz_outlined), onTap: () {
            Fluttertoast.showToast(msg: "More icon clicked");
          },),
          SizedBox(width: 16, height: 16,),

          InkWell(child: Icon(Icons.headphones), onTap: () {
              Fluttertoast.showToast(msg: "Headphone icon clicked");
          },),
          SizedBox(width: 16, height: 16,),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              child: Text("Hello World"),
              width: 200,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 5),
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),

            Row(
              children: [

                Container(
                  child: Text("1"),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),

                Container(
                  child: Text("2"),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),

                Container(
                  child: Text("3"),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),

              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // horizontal
              crossAxisAlignment: CrossAxisAlignment.end, // vertical
            ),

            Column(
              children: [

                Container(
                  child: Text("1"),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),

                Container(
                  child: Text("2"),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),

                Container(
                  child: Text("3"),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),

              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //vertical
              crossAxisAlignment: CrossAxisAlignment.center, //horizontal
            ),






          ],
        ),
      ),

     /* floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          Fluttertoast.showToast(msg: "FAB icon clicked");
        },
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        mini: true,

      ),*/

      floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: Container(
          color: Colors.orange,
          child: Text("Click"),
            alignment: Alignment.center,
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
