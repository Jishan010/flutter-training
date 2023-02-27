import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'album.g.dart';

@JsonSerializable()
class Album extends Equatable {
  final int userId;
  final int id;
  final String title;

  const Album(this.userId, this.id, this.title);

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [userId, id, title];

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
