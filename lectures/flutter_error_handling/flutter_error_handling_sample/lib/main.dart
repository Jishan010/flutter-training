import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

// https://dartpad.dev/workshops.html?webserver=https://handling-errors-gracefully.web.app#Step1
// https://github.com/flutter/flutter/issues/97516
// https://docs.flutter.dev/testing/errors#define-a-custom-error-widget-for-build-phase-errors
// https://medium.com/geekculture/mastering-flutter-zones-ea28fe6a6ca6

void main() {
  // to catch synchronous error you need to use FlutterError.OnError
  FlutterError.onError = (details) {
    log("kaboom ==> ${details.exceptionAsString()}", stackTrace: details.stack);
  };
// When an error occurs during the build phase,
// the ErrorWidget.builder callback is invoked to build the widget that is used
// instead of the one that failed.
  ErrorWidget.builder =
      (details) => Center(child: Text(details.exceptionAsString()));

  // asynchronous error you need to use runZonedGuarded.onError
  runZonedGuarded(
    () => runApp(const MyCrashApp()),
    (error, stack) async {
      log("catched ${error.toString()}", stackTrace: stack);
      //exit(1);
    },
  );
}
class MyCrashApp extends StatelessWidget {
  const MyCrashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        // Widget error = const Text('...rendering error...');
        // if (widget is Scaffold || widget is Navigator) {
        //   error = Scaffold(body: Center(child: error));
        // }
        // ErrorWidget.builder = (errorDetails) => error;
        // if (widget != null) return widget;

        // throw ('widget is null');
        return _getWidget()!;
        // return Center(
        //   child: TextButton(
        //       onPressed: () {
        //         // _doSomeWorkAsynch();
        //         _doSomeWorkSynch();
        //       },
        //       child: const Text('TextButton')),
        // );
      },
    );
  }

  void _doSomeWorkAsynch() async {
    return Future.delayed(const Duration(seconds: 1), throw Exception());
  }

  void _doSomeWorkSynch() {
    throw Exception();
  }

  Widget? _getWidget() => null;
}
