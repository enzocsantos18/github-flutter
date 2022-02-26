
import 'package:github_flutter/models/repo_model.dart';

abstract class RepoRepository {
  Future<List<Repo>> getReposByUser(String user);
}