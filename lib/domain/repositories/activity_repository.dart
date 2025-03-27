

import 'package:gym_app/domain/entities/activity.dart';

abstract class ActivityRepository {
  Future<List<Activity>> getGymActivities();
}