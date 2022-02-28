import 'package:flutter/material.dart';
import 'package:github_flutter/models/repo_model.dart';

class RepoPage extends StatelessWidget {
  const RepoPage({Key? key, required this.repo}) : super(key: key);

  final Repo repo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repo.fullName)),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Informações',
                    style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 10,),
                Text('Nome: ' + repo.fullName),
                const SizedBox(height: 10,),

                Text('Descrição: ' + (repo.description ?? '-')),
                const SizedBox(height: 10,),

                Text('Linguagem: ' + (repo.language ?? '-')),
                const SizedBox(height: 10,),

                Text('Watchers: ' + repo.watchers.toString()),
                const SizedBox(height: 10,),

                Text('Issues: ' + repo.openIssues.toString()),
                const SizedBox(height: 10,),

                Text('Criado em: ' + repo.createdAt),
                Text('Updated em: ' + (repo.updatedAt ?? '-')),
                const SizedBox(height: 60,),

                Center(
                  child: ElevatedButton(
                      onPressed: () async {},
                      child: const Text('Acessar via web')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
