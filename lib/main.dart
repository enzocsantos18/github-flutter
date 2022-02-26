import 'package:flutter/material.dart';
import 'package:github_flutter/pages/search_page.dart';
import 'package:github_flutter/pages/user_page.dart';

void main() {
  runApp(GithubApp());
}


class GithubApp extends StatelessWidget {
  const GithubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Flutter',
      theme: ThemeData.dark(),
      home: SearchPage(),
    );
  }
}
