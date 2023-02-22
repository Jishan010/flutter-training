// https://api.dart.dev/stable/2.19.2/dart-async/Stream/asBroadcastStream.html
void main(List<String> args) async {
  final numberStream =
      Stream.periodic(Duration(seconds: 1), (count) => count).take(20);
  // create a broadcast stream
  final broadcastStream = numberStream.asBroadcastStream(
    onCancel: (subscription) {
      subscription.pause();
    },
    onListen: (subscription) {
      if (subscription.isPaused) {
        subscription.resume();
      }
    },
  );

  final oddStream = broadcastStream.where((event) => event.isOdd);
  final oddStreamListener = oddStream.listen((event) {
    print("odd: $event");
  })
    ..onDone(() {
      print("odd done");
    });

  final evenStream = broadcastStream.where((event) => event.isEven);
  final evenStreamListener = evenStream.listen((event) {
    print("Even: $event");
  })
    ..onDone(() {
      print("even done");
    });

  await Future.delayed(Duration(seconds: 5));

  await oddStreamListener.cancel();
  await evenStreamListener.cancel();

  await Future.delayed(const Duration(seconds: 2));
  print(await broadcastStream.first);
}
