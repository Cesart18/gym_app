

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gym_app/domain/datasources/trainer_datasource.dart';
import 'package:gym_app/domain/entities/trainer.dart';
import 'package:gym_app/infrastructure/errors/custom_error.dart';
import 'package:gym_app/infrastructure/mappers/trainer_mapper.dart';
import 'package:gym_app/infrastructure/models/trainer_model.dart';

class TrainerDatasourceImpl implements TrainerDatasource {
  @override
  Future<Trainer> getTrainerByActivity(int activityID) async {
    try {
      final resp = await rootBundle.loadString('assets/response_calls/list_trainers.json');
      final List<dynamic> data = json.decode(resp);
      final List<TrainerModel> trainers = data.map((t) => TrainerModel.fromJson(json.decode(t))).toList();
      return TrainerMapper.modelToEntity(trainers.firstWhere((t) => t.actividades.contains(activityID)));
    } catch (e) {
      throw CustomError(message: 'error getting trainer');
    }
  }
}