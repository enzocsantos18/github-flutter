import 'package:flutter/cupertino.dart';
import 'package:github_flutter/models/repo_model.dart';
import 'package:github_flutter/models/user_model.dart';
import 'package:github_flutter/repositories/repo_repository.dart';
import 'package:github_flutter/repositories/user_repository.dart';

class RepoController {
  ValueNotifier<List<Repo>> repo = ValueNotifier<List<Repo>>(List.empty());

  final RepoRepository _repoRepository;

  RepoController(this._repoRepository);

  getByUsername(String name) async {
    try {
      repo.value = await _repoRepository.getReposByUser(name);
    } on Exception catch (_) {
      repo.value = List.empty();
    }
  }
}
