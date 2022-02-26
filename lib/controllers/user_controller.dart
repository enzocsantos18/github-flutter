import 'package:flutter/cupertino.dart';
import 'package:github_flutter/models/user_model.dart';
import 'package:github_flutter/repositories/user_repository.dart';

class UserController {

  ValueNotifier<User?> user = ValueNotifier<User?>(null);

  final UserRepository _userRepository;


  UserController(this._userRepository) {
  }

  getByName(String name) async {
    try {
      user.value = await _userRepository.getUser(name);
    }
    on Exception catch (_){
      user.value = null;
    }
  }

}