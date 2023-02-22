// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'person.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String name;
  @JsonKey(name: "date_time")
  final DateTime dateTime;

  final List<Person> cast;
  Movie({
    required this.name,
    required this.dateTime,
    required this.cast
  });
  @override
  String toString() => 'Movie(name: $name, dateTime: $dateTime, cast:$cast)';

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.name == name && other.dateTime == dateTime;
  }

  @override
  int get hashCode => name.hashCode ^ dateTime.hashCode;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
