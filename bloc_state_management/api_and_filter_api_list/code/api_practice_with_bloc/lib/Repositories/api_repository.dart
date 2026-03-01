import 'dart:convert';
import 'dart:io';

import 'package:api_practice_with_bloc/Model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((post) => PostModel.fromJson(post)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } on SocketException catch (e) {
      throw Exception('No Internet connection: $e');
    } on HttpException catch (e) {
      throw Exception('HTTP error: $e');
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}
