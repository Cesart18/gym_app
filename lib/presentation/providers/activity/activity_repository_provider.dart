

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/domain/repositories/activity_repository.dart';
import 'package:gym_app/infrastructure/repositories/activity_repository_impl.dart';

final activityRepositoryProvider = Provider<ActivityRepository>((ref) {
  return ActivityRepositoryImpl();
});