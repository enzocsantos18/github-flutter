
import 'package:github_flutter/models/repo_model.dart';
import 'package:github_flutter/models/user_model.dart';
import 'package:github_flutter/repositories/repo_repository.dart';
import 'package:github_flutter/service/dio_service.dart';

class RepoRepositoryImpl implements RepoRepository {

  final DioService _dioService;

  RepoRepositoryImpl(this._dioService);

  @override
  Future<List<Repo>> getReposByUser(String user) async {
    var result = await _dioService.getDio().get('/users/$user/repos');

    return (result.data as List)
        .map((x) => Repo.fromJson(x))
        .toList();
  }
}