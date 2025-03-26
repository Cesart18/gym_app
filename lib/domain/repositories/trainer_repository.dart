

import 'package:gym_app/domain/entities/trainer.dart';

abstract class TrainerRepository {
  Future<Trainer> getTrainerByActivity(int activityID);
}