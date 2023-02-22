import 'package:equatable/equatable.dart';

// https://pub.dev/packages/equatable
class Person extends Equatable {
  final String name;
  final String email;
  Person(this.name, this.email);

  // check equality
  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Person && other.name == name && other.email == email;

  // @override
  // int get hashCode => Object.hash(name, email);

  // json de-serializer
  Person.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        email = json["email"];

  // json serializer
  Map<String, dynamic> toJson() {
    return {"name": name, "email": email};
  }

  @override
  bool get stringify => true;

  // @override
  // String toString() => "User(name:$name,email:$email)";

  @override
  List<Object?> get props => [name, email];
}
