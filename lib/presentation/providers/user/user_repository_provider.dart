
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/domain/repositories/user_repository.dart';
import 'package:gym_app/infrastructure/repositories/user_repository_impl.dart';


final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl();
});