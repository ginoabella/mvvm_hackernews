import 'package:flutter/material.dart';
import 'package:hacker_news/models/story.dart';
import 'package:hacker_news/services/error_service.dart';
import 'package:hacker_news/services/webservice.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

enum Status { init, completed, busy, empty, error }

class StoryListViewModel extends ChangeNotifier {
  Status _status = Status.init;
  List<StoryViewModel> _stories = <StoryViewModel>[];

  Status get state => _status;
  List<StoryViewModel> get stories => _stories;

  Future<void> getTopStories() async {
    _status = Status.busy;

    if (_stories.isNotEmpty) {
      // still in initializing state and will cause error if below will be executed
      notifyListeners();
    }

    final Iterable results = await Webservice().getTopStories().catchError(
          (e) => ErrorService.setError(
              description: '${e.toString()}Failed retrieving Data'),
        );

    if (ErrorService.hasError(reset: true)) {
      _status = Status.error;
    } else {
      _stories = results
          .map((story) => StoryViewModel(story: story as Story))
          .toList();
      _status = Status.completed;
    }

    notifyListeners();
  }

  String erroDescription = ErrorService.errorDescription;
}
