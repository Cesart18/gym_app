

import 'package:gym_app/domain/entities/activity.dart';

abstract class ActivityDatasource {
  Future<List<Activity>> getGymActivities();
}