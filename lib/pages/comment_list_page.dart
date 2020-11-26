import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/comment_list_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';
import 'package:hacker_news/widgets/comment_list.dart';
import 'package:provider/provider.dart';

class CommentListPage extends StatefulWidget {
  final StoryViewModel storyVM;

  const CommentListPage({Key key, this.storyVM}) : super(key: key);

  @override
  _CommentListPageState createState() => _CommentListPageState();
}

class _CommentListPageState extends State<CommentListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CommentListViewModel>(context, listen: false)
        .getCommentByStory(widget.storyVM, inbuildProcess: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.storyVM.title),
      ),
      body: Consumer<CommentListViewModel>(
        builder: (context, model, child) => _buildBody(context, model),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CommentListViewModel model) {
    switch (model.state) {
      case Status.busy:
        return const Center(child: CircularProgressIndicator());
      case Status.completed:
        return CommentList(commentListVM: model);
      case Status.error:
        return Center(
          child: Text(model.erroDescription),
        );
      default:
        return const Text('Error, should not reach this');
    }
  }
}
