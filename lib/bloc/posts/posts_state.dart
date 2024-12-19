part of 'posts_bloc.dart';

final class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<PostsModel> postsList;
  final String message;
  const PostsState({
    this.postStatus = PostStatus.loading,
    this.postsList = const <PostsModel>[],
    this.message = '',
  });
  PostsState copyWith(
      {PostStatus? postStatus, List<PostsModel>? postsList, String? message}) {
    return PostsState(
      postsList: postsList ?? this.postsList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [postStatus, postsList, message];
}
