import 'dart:convert';
import 'movie.dart';
import 'person.dart';

// https://docs.flutter.dev/development/data-and-backend/json
void main(List<String> arguments) {
  // #1
  // decodeWithJsonDecode();

  // #2 json_serilizable
  // decodeWIthjsonSerializable();

  // #3
  equalityCheck();
}

void equalityCheck() {
   final person1 = Person("Arindom", "arindom@abc.com");
  final person2 = Person("Arindom", "arindom@abc.com");
  
  print(person1 == person2);
  print(person1.hashCode);
  print(person2.hashCode);
  print(person1);
}

void decodeWIthjsonSerializable() {
  final json = """
    {
      "name": "Batman",
      "date_time":"1989-06-19",
      "cast":[
          {
            "name": "Michael Keaton",
            "email": "michaek@abc.com"
          },
          {
            "name":"Jack Nicholson",
            "email":"jacknick@abc.com"
          }
      ]
    }
  """
      .trim();

  final movieJson = jsonDecode(json);
  final movie = Movie.fromJson(movieJson);
  print(movieJson);
  print(movie);
}

// https://api.dart.dev/stable/2.19.2/dart-convert/JsonCodec-class.html
void decodeWithJsonDecode() {
  final dummyResponse = """
  {
    "name":"Arindom",
    "email":"arindom@abc.com"
  }
  """
      .trim();
  final userJson = jsonDecode(dummyResponse);
  final user = Person.fromJson(userJson);
  print(userJson);
  print(user);
}
