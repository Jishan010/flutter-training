import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_album/repos/api_response.dart';
import 'package:my_album/repos/photo.dart';

class AlbumServicesDio {
  final Dio _dio;
  const AlbumServicesDio(
    this._dio,
  );

  Future<List<Photo>> getPhotoes() async {
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
  }

  Future<ApiResponse<List<Photo>>> getPhotoesafe() async {
    return safeApiCall(
      () async {
        final response = await _dio.get(
          "/photos",
        );
        ApiResponse<List<Photo>> parseResponse(dynamic data) {
          final parsed = data.cast<Map<String, dynamic>>();
          // throw Exception("Dummy Exception");
          return ApiResponseSuccess(
            parsed
                .map<Photo>(
                  (json) => Photo.fromJson(json),
                )
                .toList(),
          );
        }

        return compute(parseResponse, response.data);
      },
    );
  }
}

Future<ApiResponse<T>> safeApiCall<T>(
    Future<ApiResponse<T>> Function() apiCall) async {
  try {
    return await apiCall();
  } on DioError catch (dioErr) {
    switch (dioErr.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ApiFailure(ApiException(ApiExceptionType.timeOutException));
      case DioErrorType.badCertificate:
        return ApiFailure(ApiException(ApiExceptionType.authException));
      case DioErrorType.badResponse:
        return ApiFailure(ApiException(ApiExceptionType.badResponse));
      case DioErrorType.cancel:
      case DioErrorType.connectionError:
      case DioErrorType.unknown:
        return ApiFailure(ApiException(ApiExceptionType.unKnown));
    }
  } catch (exc) {
    return ApiFailure(ApiException(ApiExceptionType.unKnown));
  }
}
