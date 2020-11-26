import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/story_list_view_model.dart';
import 'package:hacker_news/widgets/story_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacker News'),
      ),
      body: Consumer<StoryListViewModel>(
        builder: (context, model, child) => _buildBody(context, model),
      ),
    );
  }

  // Widget _buildFuture(BuildContext context, StoryListViewModel model) {
  //   return FutureBuilder(
  //     future: model.getTopStories(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return StoryList(stories: snapshot.data);
  //       }
  //     },
  //   );
  // }

  Widget _buildBody(BuildContext context, StoryListViewModel model) {
    switch (model.state) {
      case Status.init:
        model.getTopStories();
        return const Center(child: CircularProgressIndicator());
      case Status.busy:
        return const Center(child: CircularProgressIndicator());
      case Status.completed:
        return StoryList(stories: model.stories);
      case Status.error:
        return Center(
          child: Text(model.erroDescription),
        );
      default:
        return const Text('Error, should not reach this');
    }
  }
}
