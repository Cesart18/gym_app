

import 'package:gym_app/domain/entities/trainer.dart';

abstract class TrainerDatasource {
  Future<Trainer> getTrainerByID(int trainerID);
}