import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_client.dart';
import 'blocs/connectioon_checker_bloc.dart';
import 'blocs/post_bloc.dart';
import 'blocs/post_event.dart';
import 'blocs/post_state.dart';

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
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  static const methodChannel = MethodChannel('com.example.bloc_example/battery');

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });


   if(Platform.isAndroid){

   }else{

   }

  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostBloc(apiClient: ApiClient())..add(FetchPostsEvent()),
        ),
        BlocProvider(
          create: (context) => ConnectioonCheckerBloc()..add(ConnectionObserveEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(Platform.isAndroid == true ? "Android": "Ios"),
        ),
        body: BlocListener<ConnectioonCheckerBloc, ConnectioonCheckerState>(
          listener: (context, state) {
            if (state is ConnectionSuccessState) {
              _getBatteryLevel();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('network success'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('network failure'),
                ),
              );
            }
          },
          child: BlocConsumer<PostBloc, PostState>(
            listener: (context, state) {
              if (state is PostLoadingState) {
                //Log
                //Navigator
                //display toast , alert dialogue
                //success
                //anything which is not related to widegt will go here
              } else if (state is PostSuccessState) {
                //falilure
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('post loaded'),
                  ),
                );
              } else if (state is PostFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('post failed'),
                  ),
                );
              } else {}
            },
            builder: (context, state) {
              if (state is PostLoadingState) {
                //Log
                //Navigator
                //display toast , alert dialogue
                //success
                //anything which is not related to widegt will go here
                return Center(child: Text('loading..'));
              } else if (state is PostSuccessState) {
                //falilure
                return Center(child: Text(_batteryLevel));
              } else if (state is PostFailureState) {
                return Center(child: Text(state.error));
              } else {
                return SizedBox();
              }
            },
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
