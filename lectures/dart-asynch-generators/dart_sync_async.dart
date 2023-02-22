import 'dart:convert';

void main(List<String> args) {
  inAsync().forEach((element) {
    print("async $element");
  });
  inSync().forEach((event) => print("isSync$event"));
}

Iterable<int> inSync() sync* {
  for (var i = 0; i <= 5; i++) {
    yield i;
  }
}

Stream<int> inAsync() async* {
  for (var i = 0; i <= 5; i++) {
    yield i;
  }
}
