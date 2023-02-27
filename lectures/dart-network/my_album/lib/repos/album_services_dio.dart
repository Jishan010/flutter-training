import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_album/repos/photo.dart';

class AlbumServicesDio {
  final Dio _dio;
  const AlbumServicesDio(
    this._dio,
  );

  Future<List<Photo>> getPhotoes() async {
    return safeApiCall(
      () async {
        final response = await _dio.get(
          "/photos",
        );
        List<Photo> parseResponse(dynamic data) {
          final parsed = data.cast<Map<String, dynamic>>();
          return parsed
              .map<Photo>(
                (json) => Photo.fromJson(json),
              )
              .toList();
        }
        return compute(parseResponse, response.data);
      },
    );
  }
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
    // Todo: handle exception properly
    throw Exception("No idea");
  }
}
