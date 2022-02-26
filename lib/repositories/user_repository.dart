
import 'package:github_flutter/models/user_model.dart';

abstract class UserRepository {
  Future<User> getUser(String user);
}