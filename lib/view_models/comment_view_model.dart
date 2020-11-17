import 'package:hacker_news/models/comment.dart';

class CommentViewModel {
  final Comment _comment;

  CommentViewModel({Comment comment}) : _comment = comment;

  String get title => _comment.title;
  int get commentId => _comment.commentId;
}
