import 'dart:convert';

import 'package:counter_app/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  Future<List<PostsModel>?> fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body
            .map((model) => PostsModel(
                  postId: model['postId'] as int,
                  email: model['email'] as String,
                  body: model['body'] as String,
                ))
            .toList();
      }
    } catch (e) {
      throw Exception('error while fetching data in here');
    }
    return null;
  }
}
