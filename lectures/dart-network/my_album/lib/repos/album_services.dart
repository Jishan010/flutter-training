import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_album/repos/photo.dart';
// https://pub.dev/documentation/http/latest/index.html
class AlbumServices {
  final _header = {
    HttpHeaders.authorizationHeader: "api token",
    "x-app-info":"my-album"
  };

  Future<List<Photo>> getPhotoes() async {
    final responseBody = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos"),
      headers: _header,
    );
    return compute(parsePhoto, responseBody.body);
  }

  List<Photo> parsePhoto(
    String response,
  ) {
    final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
    return parsed
        .map<Photo>(
          (json) => Photo.fromJson(
            json,
          ),
        )
        .toList();
  }
}
