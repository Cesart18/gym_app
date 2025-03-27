

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/domain/repositories/trainer_repository.dart';
import 'package:gym_app/infrastructure/repositories/trainer_repository_impl.dart';

final trainerRepositoryProvider = Provider<TrainerRepository>((ref) {
  return TrainerRepositoryImpl();
});