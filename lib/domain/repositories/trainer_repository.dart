

import 'package:gym_app/domain/entities/trainer.dart';

abstract class TrainerRepository {
  Future<Trainer> getTrainerByID(int trainerID);
}