import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:test/expect.dart';

import 'album.dart';
import 'photo.dart';

void main(List<String> arguments) {
  // fetchAlbum().then((response) {
  //   if (response.statusCode == 200) {
  //     final album = Album.fromJson(jsonDecode(response.body));
  //     print(album);
  //   }
  // }).catchError((error, stackTrace) {
  //   print(error?.toString() ?? "");
  // });

  // getPhotoes();
  getPhotoesDio().then((response) {
    print(response.length);
    // prints(response.data);
    // print(response.statusCode);
    // print(response.statusMessage);
    // print(response.headers);
    // print(response.requestOptions);
  }).catchError((err) {
    print(err);
  });
}

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

void getPhotoes() async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/photos"),
  );
  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
  final photoes = parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  print(photoes.length);
}

final Dio _dio = Dio(
  BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      contentType: Headers.jsonContentType,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        HttpHeaders.authorizationHeader: "api token",
        "x-app-info": "my-album"
      },
      // default
      validateStatus: (status) =>
          status != null && status >= 200 && status < 300),
);

Future<List<Photo>> getPhotoesDio() async {
  return safeApiCall(() async {
    final response = await _dio.get(
      "/photos",
    );
    List<Map<String, dynamic>> parsed =
        response.data.cast<Map<String, dynamic>>();
    final photoes = parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
    return photoes;
  });
}

Future<T> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    return await apiCall();
  // } on DioError catch (dioErr) {
  //   switch (dioErr.type) {
  //     case DioErrorType.connectionTimeout:
  //       // TODO: Handle this case.
  //       break;
  //     case DioErrorType.sendTimeout:
  //       // TODO: Handle this case.
  //       break;
  //     case DioErrorType.receiveTimeout:
  //       // TODO: Handle this case.
  //       break;
  //     case DioErrorType.badCertificate:
  //       // TODO: Handle this case.
  //       break;
  //     case DioErrorType.badResponse:
  //       // TODO: Handle this case.
  //       break;
  //     case DioErrorType.cancel:
  //       // TODO: Handle this case.
  //       break;
  //     case DioErrorType.connectionError:
  //       // TODO: Handle this case.
  //       break;
  //     case DioErrorType.unknown:
  //       // TODO: Handle this case.
  //       break;
  //   }
  } catch (exc) {
    throw Exception("No idea");
  }
}
