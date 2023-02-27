import 'package:flutter/material.dart';
import 'package:overview_widget/Logger.dart';

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
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    Logger.printLog("Func createState called");
   return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool value = false;
  bool checkBoxValue = false;

  void _incrementCounter() {
    setState(() {
      Logger.printLog("Func setStateCalled");
      _counter++;
      value = !value;

      /*if(checkBoxValue){
        checkBoxValue = false;
      } else {
        checkBoxValue = true;
      }*/
    });
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    Logger.printLog("didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    Logger.printLog("Func build called");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            //state less
            Text("Hello World", style: TextStyle(color: (value) ? Colors.yellow : Colors.red)),


            //state full
            Checkbox(value: checkBoxValue, onChanged: (newValue) {
              Logger.printLog("New value : $newValue");
              setState(() {
                checkBoxValue = !checkBoxValue;
              });
            },),


            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            Padding(padding: EdgeInsets.only(top: 20), child: Text("Text with padding"),),
            SizedBox(width: 200, height: 100, child: Container(color: Colors.green),),



            ElevatedButton(onPressed: (){
              // for the dispose
              //Navigator.pop(context);
              Logger.printLog("On button pressed");

            }, child: Text("Close"), onFocusChange: (value) => {
              Logger.printLog("Focus change : new focus is $value")
            }, onHover: (newHover){
              Logger.printLog("Hove change : new hover is $newHover");
            },)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    Logger.printLog("Func dispose called");
    super.dispose();
  }

}
