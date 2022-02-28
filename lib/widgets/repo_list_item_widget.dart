import 'package:flutter/material.dart';
import 'package:github_flutter/models/repo_model.dart';
import 'package:github_flutter/pages/repo_page.dart';

class RepoListItemWidget extends StatelessWidget {
  const RepoListItemWidget({Key? key, required this.repo}) : super(key: key);

  final Repo repo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          tileColor: Colors.black26,
          title: Text(repo.fullName),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RepoPage(repo: repo,), fullscreenDialog: true));
          }),
    );
  }
}
