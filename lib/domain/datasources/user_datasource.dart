

import 'package:gym_app/domain/entities/user.dart';

abstract class UserDatasource {
  Future<User> login();
}