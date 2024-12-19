import 'package:counter_app/bloc/posts/posts_bloc.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PostStatus.failure:
            return Center(
              child: Text(state.message),
            );
          case PostStatus.success:
            return ListView.builder(
                itemCount: state.postsList.length,
                itemBuilder: (context, index) {
                  final item = state.postsList[index];
                  return ListTile(
                    title: Text(item.email.toString()),
                    subtitle: Text(item.body.toString()),
                  );
                });
        }
      }),
    );
  }
}
