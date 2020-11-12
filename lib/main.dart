import 'package:flutter/material.dart';
import 'package:hacker_news/pages/home_page.dart';
import 'package:hacker_news/provider_setup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Hacker News',
        home: HomePage(),
      ),
    );
  }
}
