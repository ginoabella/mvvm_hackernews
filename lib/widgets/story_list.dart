import 'package:flutter/material.dart';
import 'package:hacker_news/ui_shared/text_style.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

class StoryList extends StatelessWidget {
  final List<StoryViewModel> _stories;

  const StoryList({@required List<StoryViewModel> stories})
      : _stories = stories;

  @override
  Widget build(BuildContext context) {
    //final _vm = Provider.of<StoryListViewModel>(context);
    return ListView.builder(
      itemCount: _stories.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          _stories[index].title,
          style: kStoryListStyle,
        ),
      ),
    );
  }
}
