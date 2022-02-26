import 'package:flutter/material.dart';
import 'package:github_flutter/models/repo_model.dart';

class RepoPage extends StatelessWidget {
  const RepoPage({Key? key, required this.repo}) : super(key: key);

  final Repo? repo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('enzocsantos18/alurapic')),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Repo'),
              Text(repo?.fullName ?? ''),
              Text(repo?.description ?? ''),
              Text(repo?.language ?? ''),
              Text(repo?.watchers.toString() ?? ''),
              Text(repo?.openIssues.toString() ?? ''),
              ElevatedButton(
                  onPressed: () async {}, child: Text('Acessar via web'))
            ],
          ),
        ),
      ),
    );
  }
}
