import 'package:flutter/foundation.dart';
import 'package:hacker_news/service_locator.dart';
import 'package:hacker_news/services/data_service.dart';
import 'package:hacker_news/services/error_service.dart';
import 'package:hacker_news/view_models/comment_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

enum Status { init, completed, busy, empty, error }

class CommentListViewModel extends ChangeNotifier {
  Status _status = Status.init;

  List<CommentViewModel> comments = <CommentViewModel>[];

  Status get state => _status;

  Future<void> getCommentByStory(StoryViewModel storyVM,
      {bool inbuildProcess = false}) async {
    _status = Status.busy;
    // suppress rebuild while the listeners are stilling executing rebuild.
    if (!inbuildProcess) notifyListeners();

    final DataService _dataService = locator<DataService>();
    final result = await _dataService
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
