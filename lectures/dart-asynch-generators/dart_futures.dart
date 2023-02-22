import 'dart:async';

void main(List<String> args) async{
  // readFromFile().onError((error, stackTrace) {
  //   error as Exception;
  //   return error.toString();
  // }).then(print);
}

Future<String> readFromFile() {
  return Future.error(Exception("unable to read"));
  // return Future.value("Hello there");
  // return Future.delayed(Duration(seconds: 2), () => "hello there");
}

void runTimer() async {
  var counter = 60;
  Timer.periodic(Duration(seconds: 1), (timer) {
    counter--;
    print(timer.tick);
    if (counter == 0) {
      timer.cancel();
    }
  });
}
