

import 'package:gym_app/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> login();
}