


import 'package:gym_app/domain/datasources/trainer_datasource.dart';
import 'package:gym_app/domain/entities/trainer.dart';
import 'package:gym_app/domain/repositories/trainer_repository.dart';
import 'package:gym_app/infrastructure/datasources/trainer_datasource_impl.dart';

class TrainerRepositoryImpl implements TrainerRepository {

  final TrainerDatasource datasource;

  TrainerRepositoryImpl({TrainerDatasource? datasource}):datasource = datasource ?? TrainerDatasourceImpl();

  @override
  Future<Trainer> getTrainerByID(int trainerID) {
    return datasource.getTrainerByID(trainerID);
  }
}