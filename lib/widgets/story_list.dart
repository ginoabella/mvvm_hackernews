import 'package:flutter/material.dart';
import 'package:hacker_news/ui_shared/text_style.dart';
import 'package:hacker_news/utils/constants.dart';
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
        onTap: _stories[index].noOfComments == 0
            ? null
            : () => Navigator.pushNamed(
                  context,
                  RoutePaths.commentView,
                  arguments: _stories[index],
                ),
        title: Text(
          _stories[index].title,
          style: kStoryListStyle,
        ),
        trailing: Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(6)),
          child: Text(
            '${_stories[index].noOfComments}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
