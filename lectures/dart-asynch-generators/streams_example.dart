import 'dart:async';
// https://pub.dev/packages/async/install
void main(List<String> args) async {
  // #1 normal
  // counter(10).forEach(print);
  // # 2 periadic
  // streamPeriodic(60).forEach(print);

  // # 3
  // try {
  //   await for (final data in streamWithError()) {
  //     print(data);
  //   }
  // } catch (e) {
  //   print(e.toString());
  // }

  // #4
  // stream Subciption
  // streamWithError().listen(print).onError((e) => print(e.toString()));

  // #5
  // streamFromFutures().listen(print);
}

//  # 1 Simple stream
Stream<int> counter(int num) async* {
  while (num >= 0) {
    num--;
    yield num;
  }
}

// # 2 periodic emit with delay
Stream<int> streamPeriodic(int num) {
  return Stream.periodic(Duration(seconds: 1), (count) => count).take(num);
}

// # 3 stream with Error
Stream<int> streamWithError() {
  return Stream.error(Exception("Some thing happeed"));
}

Stream<String> streamFromFutures() {
  final foo = Future.value("foo");
  final bar = Future.value("bar");

  return Stream.fromFutures([foo, bar]);
}


