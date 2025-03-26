

import 'package:gym_app/domain/entities/trainer.dart';

abstract class TrainerDatasource {
  Future<Trainer> getTrainerByActivity(int activityID);
}