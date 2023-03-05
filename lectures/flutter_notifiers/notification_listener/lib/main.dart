import 'package:flutter/material.dart';
// prepare a sample app 
// https://reactree.com/pagination-in-nestedscrollview-using-scrollnotification-in-flutter/
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
  final _message = ValueNotifier<String>("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: _message,
              builder: (buildContext, message, child) {
                return Text(message);
              }),
          Expanded(
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _message.value = 'Scroll Started';
                } else if (scrollNotification is ScrollUpdateNotification) {
                  _message.value = 'Scroll Updated';
                } else if (scrollNotification is ScrollEndNotification) {
                  _message.value = 'Scroll Ended';
                }
                return true;
              },
              // todo look in into scrollcontroller
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (buildCOntext, index) {
                  return ListTile(
                    title: Text("Item: $index"),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
