import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_album/di/locator.dart';
import 'package:my_album/repos/album_client.dart';
import 'package:my_album/repos/album_services.dart';
import 'package:my_album/repos/album_services_dio.dart';
import 'package:my_album/repos/api_response.dart';
import 'package:my_album/repos/photo.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHomePage> {
  // late AlbumServices _albumServices;
  late final AlbumServicesDio _albumServicesDio;
  @override
  @mustCallSuper
  void initState() {
    // _albumServices = AlbumServices();
    // final albumClient = AlbumClient();
    _albumServicesDio = getIt<AlbumServicesDio>();
    // AlbumServicesDio(
    //   albumClient.getClient(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<ApiResponse<List<Photo>>>(
        future: _albumServicesDio.getPhotoesafe(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            final response = snapshot.data!;
            if (response is ApiResponseSuccess<List<Photo>>) {
              return PhotosList(photos: response.payload);
            } else if (response is ApiFailure<List<Photo>>) {
              return Center(
                child: Text(response.error.toString()),
              );
            } else {
              return const Placeholder();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // FutureBuilder<List<Photo>>(
      //   future: _albumServicesDio.getPhotoes(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return const Center(
      //         child: Text('An error has occurred!'),
      //       );
      //     } else if (snapshot.hasData) {
      //       return PhotosList(photos: snapshot.data!);
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return CachedNetworkImage(
          imageUrl: photos[index].thumbnailUrl,
          // placeholder: (context, url) => const Center(
          //   child: CircularProgressIndicator(),
          // ),
          progressIndicatorBuilder: (context, url, download) {
            if (download.progress != null) {
              return CircularProgressIndicator(
                value: download.progress,
              );
            }
            return Center(
              child: Image.asset(
                "assets/images/loading.gif",
              ),
            );
          },
        );
        // https://docs.flutter.dev/cookbook/images/fading-in-images
        // return FadeInImage.assetNetwork(
        //   placeholder: "assets/images/loading.gif",
        //   image: photos[index].thumbnailUrl,

        // );
        // https://api.flutter.dev/flutter/widgets/Image-class.html
        // return Image.network(
        //   photos[index].thumbnailUrl,
        //   loadingBuilder: (context, child, loadingProgress) {
        //     if (loadingProgress == null) {
        //       return child;
        //     } else {
        //       return const CircularProgressIndicator();
        //     }
        //   },
        // );
      },
    );
  }
}
