import 'package:get_it/get_it.dart';
import 'package:my_album/repos/album_client.dart';
import 'package:my_album/repos/album_services_dio.dart';

final getIt = GetIt.instance;
// https://pub.dev/packages/get_it/install
// https://www.burkharts.net/apps/blog/one-to-find-them-all-how-to-use-service-locators-with-flutter/
void init() {
  getIt
      .registerLazySingleton<AlbumServicesDio>(() => AlbumServicesDio(AlbumClient().getClient()));
}
