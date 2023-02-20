import 'dart:async';
import 'dart:math';

void main(List<String> args) async {
  // #1
  // singleStreamController();

  // #2
  broadcastStreamController();
}

void broadcastStreamController() async {
  //https://api.dart.dev/stable/2.19.2/dart-async/StreamController/StreamController.broadcast.html
  final streamController = StreamController.broadcast(
    onListen: () => print("Linstening"),
    onCancel: () => print("cancle"),
  );
  final stream =
      Stream.periodic(Duration(seconds: 1), (count) => count).take(10);

  streamController.sink.addStream(stream);
  final listener1 =
      streamController.stream.where((event) => event.isEven).listen(print);
  await Future.delayed(Duration(seconds: 2));
  final listener2 =
      streamController.stream.where((event) => event.isOdd).listen(print);
  await Future.delayed(Duration(seconds: 5));
  await listener1.cancel();
  await listener2.cancel();

  // await streamController.close();
}

void singleStreamController() async {
  //https://api.dart.dev/stable/2.19.2/dart-async/StreamController-class.html
  final streamController = StreamController(
    onCancel: () => print("cancled"),
    onListen: () => print("listening"),
  );
  final stream =
      Stream.periodic(Duration(seconds: 1), (count) => count).take(10);
  streamController.sink.addStream(stream);

  final listener1 = streamController.stream.listen(print);
  // Bad state: Stream has already been listened to.
  // final listener2 = streamController.stream.listen(print);
  await Future.delayed(Duration(seconds: 5));
  await listener1.cancel();
  // listener2.cancel();
  // await streamController.close();
}
