import 'package:hacker_news/models/comment.dart';
import 'package:hacker_news/models/story.dart';

abstract class DataService {
  Future<List<Story>> getTopStories();
  Future<List<Comment>> getCommentsByStory(Story story);
}
