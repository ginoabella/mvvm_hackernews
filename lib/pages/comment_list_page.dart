import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/comment_list_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';
import 'package:provider/provider.dart';

class CommentListPage extends StatelessWidget {
  final StoryViewModel storyVM;

  const CommentListPage({Key key, this.storyVM}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storyVM.title),
      ),
      body: Consumer<CommentListViewModel>(
        builder: (context, model, child) => _buildBody(context, model),
      ),
    );
  }

  ListView _buildListView(BuildContext context, CommentListViewModel model) {
    return ListView.builder(
      itemCount: model.comments.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(model.comments[index].title ?? ''),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, CommentListViewModel model) {
    switch (model.state) {
      case Status.init:
        model.getCommentByStory(storyVM);
        return const Center(child: CircularProgressIndicator());
      case Status.busy:
        return const Center(child: CircularProgressIndicator());
      case Status.completed:
        model.setInitState(); // temporary solution
        return _buildListView(context, model);
      case Status.error:
        return Center(
          child: Text(model.erroDescription),
        );
      default:
        return const Text('Error, should not reach this');
    }
  }
}
