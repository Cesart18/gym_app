

import 'package:gym_app/domain/datasources/activity_datasource.dart';
import 'package:gym_app/domain/entities/activity.dart';
import 'package:gym_app/domain/repositories/activity_repository.dart';
import 'package:gym_app/infrastructure/datasources/activity_datasource_impl.dart';

class ActivityRepositoryImpl implements ActivityRepository {

  final ActivityDatasource datasource;

  ActivityRepositoryImpl({ActivityDatasource? datasource}):datasource = datasource ?? ActivityDatasourceImpl();

  @override
  Future<List<Activity>> getGymActivities() {
    return datasource.getGymActivities();
  }
} 