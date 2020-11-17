import 'package:flutter/material.dart';
import 'package:hacker_news/provider_setup.dart';
import 'package:hacker_news/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:hacker_news/router.dart' as router;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MaterialApp(
        title: 'Hacker News',
        initialRoute: RoutePaths.homeView,
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
