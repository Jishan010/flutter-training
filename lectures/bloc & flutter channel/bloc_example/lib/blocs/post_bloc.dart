// post_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:bloc_example/blocs/post_event.dart';
import 'package:bloc_example/blocs/post_state.dart';

import '../api_client.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiClient apiClient;

  PostBloc({required this.apiClient}) : super(PostInitialState()) {
    on<FetchPostsEvent>((event, emit) async {
      try {
        final posts = await apiClient.fetchPosts();
        emit(PostSuccessState(posts));
      } catch (error) {
        emit(PostFailureState(error.toString()));
      }
    });
  }
}
