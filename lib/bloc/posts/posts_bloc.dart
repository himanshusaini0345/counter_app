import 'package:bloc/bloc.dart';
import 'package:counter_app/models/posts_model.dart';
import 'package:counter_app/repositories/posts_repository.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;
  PostsBloc({required this.postsRepository}) : super(PostsState()) {
    on<PostsFetched>((event, emit) async {
      await postsRepository.fetchPosts().then((value) {
        emit(state.copyWith(
          postStatus: PostStatus.success,
          postsList: value,
        ));
      }).onError((error, stackTrace) {
        emit(state.copyWith(
          postStatus: PostStatus.failure,
          message: error.toString(),
        ));
      });
    });
  }
}
