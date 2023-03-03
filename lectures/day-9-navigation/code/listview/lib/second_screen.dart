import 'package:flutter/material.dart';
import 'package:listview/main.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final studnet = ModalRoute.of(context)!.settings.arguments as Student;

    return Scaffold(
        appBar: AppBar(
          title: Text('${studnet.roll}'),
        ),
        body: Column(
          children: [
            Center(child: Text(studnet.name)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Press me'))
          ],
        ));
  }
}
