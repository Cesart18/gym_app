

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gym_app/domain/datasources/activity_datasource.dart';
import 'package:gym_app/domain/entities/activity.dart';
import 'package:gym_app/infrastructure/errors/custom_error.dart';
import 'package:gym_app/infrastructure/mappers/activity_mapper.dart';
import 'package:gym_app/infrastructure/models/activity_model.dart';

class ActivityDatasourceImpl implements ActivityDatasource {
  @override
  Future<List<Activity>> getGymActivities() async {
    try {
      final resp = await rootBundle.loadString('assets/response_calls/list_activities.json');
      final List<dynamic> data = json.decode(resp);
      final List<ActivityModel> activitiesModel = data.map((a) => ActivityModel.fromJson(a)).toList();
      return activitiesModel.map((a) => ActivityMapper.modelToEntity(a)).toList();
    } catch (e) {
      throw CustomError(message: 'error getting activities');
    }
  }
}