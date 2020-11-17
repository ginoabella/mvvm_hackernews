import 'package:flutter/foundation.dart';
import 'package:hacker_news/services/error_service.dart';
import 'package:hacker_news/services/webservice.dart';
import 'package:hacker_news/view_models/comment_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

enum Status { init, completed, busy, empty, error }

class CommentListViewModel extends ChangeNotifier {
  Status _status = Status.init;

  List<CommentViewModel> comments = <CommentViewModel>[];

  Status get state => _status;

  Future<void> getCommentByStory(StoryViewModel storyVM) async {
    _status = Status.busy;

    if (comments.isNotEmpty) {
      // still in initializing state and will cause error if below will be executed
      //notifyListeners();
    }
    final result = await Webservice()
        .getCommentsByStory(storyVM.story)
        .catchError((e) => ErrorService.setError(description: e.toString()));

    if (ErrorService.hasError(reset: true)) {
      _status = Status.error;
    } else {
      comments = result.map((item) => CommentViewModel(comment: item)).toList();
      _status = Status.completed;
    }
    notifyListeners();
  }

  String erroDescription = ErrorService.errorDescription;

  void setInitState() {
    _status = Status.init;
  }
}
