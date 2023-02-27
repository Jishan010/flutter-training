import 'dart:io';

import 'package:dio/dio.dart';

class AlbumClient {
  Dio getClient() {
    // https://pub.dev/documentation/dio/latest/dio/BaseOptions-class.html
    return Dio(
      BaseOptions(
          baseUrl: "https://jsonplaceholder.typicode.com",
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
          headers: {
            HttpHeaders.authorizationHeader: "api token",
            "x-app-info": "my-album"
          },
          // default return DioErrorType.badResponse
          validateStatus: (status) =>
              status != null && status >= 200 && status < 300),
    )..interceptors.add(
      // https://github.com/llfbandit/dio_cache_interceptor
      // https://pub.dev/documentation/dio/latest/dio/LogInterceptor-class.html
        LogInterceptor(),
      )
      //by default
      ..transformer = BackgroundTransformer();
  }
}
