import 'package:hacker_news/pages/home_page.dart';
import 'package:hacker_news/view_models/story_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [];
List<SingleChildWidget> dependentServices = [];
List<SingleChildWidget> uiConsumableProviders = [
  ChangeNotifierProvider(
    create: (context) => StoryListViewModel(),
    child: HomePage(),
  )
];
