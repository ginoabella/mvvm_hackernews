import 'dart:convert';

import 'package:hacker_news/models/comment.dart';
import 'package:hacker_news/models/story.dart';
import 'package:hacker_news/utils/constants.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<Story> _getStory(storyId) async {
    final url = kStoryURL.replaceFirst('STORYID', storyId.toString());
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Story.fromJson(json as Map<String, dynamic>);
      } else {
        throw Exception('Unable to fetch data');
      }
    } catch (e) {
      throw Exception('Failed HTTP Request get Story');
    }
  }

  Future<List<Story>> getTopStories() async {
    try {
      final response = await http.get(kTopStoriesURL);

      if (response.statusCode == 200) {
        final Iterable storyIds = jsonDecode(response.body) as List;
        return Future.wait(
            storyIds.take(20).map((storyId) => _getStory(storyId)));
      } else {
        throw Exception('Unable to fetch data');
      }
    } catch (e) {
      throw Exception('Failed HTTP Request get Top Stories');
    }
  }

  Future<List<Comment>> getCommentsByStory(Story story) async {
    try {
      return Future.wait(
        story.commentIds.map((commentId) async {
          final url =
              kCommentsURL.replaceFirst('COMMENTID', commentId.toString());
          final response = await http.get(url);
          if (response.statusCode == 200) {
            final json = jsonDecode(response.body);
            return Comment.fromJson(json as Map<String, dynamic>);
          } else {
            throw Exception('Unable to fetch data');
          }
        }).toList(),
      );
    } catch (e) {
      throw Exception('Failed HTTP Request');
    }
  }
}
