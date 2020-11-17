import 'package:flutter/material.dart';
import 'package:hacker_news/pages/comment_list_page.dart';
import 'package:hacker_news/pages/home_page.dart';
import 'package:hacker_news/utils/constants.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.homeView:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutePaths.commentView:
        final storyVM = settings.arguments as StoryViewModel;
        return MaterialPageRoute(
          builder: (_) => CommentListPage(storyVM: storyVM),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
