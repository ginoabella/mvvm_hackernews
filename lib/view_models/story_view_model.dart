import 'package:hacker_news/models/story.dart';

class StoryViewModel {
  final Story _story;

  StoryViewModel({Story story}) : _story = story;

  Story get story => _story;
  String get title => _story.title;
  String get url => _story.url;
  int get noOfComments => _story.commentIds.length;
}
