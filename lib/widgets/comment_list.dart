import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/comment_list_view_model.dart';
import 'package:html_unescape/html_unescape.dart';

class CommentList extends StatelessWidget {
  final CommentListViewModel commentListVM;
  CommentList({Key key, this.commentListVM}) : super(key: key);

  final unescape = HtmlUnescape();

  String _formatCommentText(String text) {
    final formattedText = unescape.convert(text ?? '');
    return formattedText.isNotEmpty
        ? formattedText.substring(0, min(200, formattedText.length))
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commentListVM.comments.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            alignment: Alignment.center,
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.orangeAccent),
            child: Text(
              '${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
              _formatCommentText(commentListVM.comments[index].title) ?? ''),
        );
      },
    );
  }
}
