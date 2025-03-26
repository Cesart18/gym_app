

import 'package:gym_app/domain/datasources/user_datasource.dart';
import 'package:gym_app/domain/entities/user.dart';
import 'package:gym_app/domain/repositories/user_repository.dart';
import 'package:gym_app/infrastructure/datasources/user_datasource_impl.dart';

class UserRepositoryImpl implements UserRepository {

  final UserDatasource datasource;

  UserRepositoryImpl({UserDatasource? datasource}):datasource = datasource ?? UserDatasourceImpl();

  @override
  Future<User> login() {
    return datasource.login();
  }
}