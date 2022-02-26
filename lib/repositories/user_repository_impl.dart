
import 'package:github_flutter/models/user_model.dart';
import 'package:github_flutter/repositories/user_repository.dart';
import 'package:github_flutter/service/dio_service.dart';

class UserRepositoryImpl implements UserRepository {

  final DioService _dioService;

  UserRepositoryImpl(this._dioService);


  @override
  Future<User> getUser(String user) async {
    var result = await _dioService.getDio().get('/users/$user');
    return User.fromJson(result.data);
  }
}