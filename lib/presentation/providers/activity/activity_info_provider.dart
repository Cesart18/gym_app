

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/domain/entities/activity.dart';
import 'package:gym_app/presentation/providers/activity/acitivity_providers.dart';

final activityInfoProvider = StateNotifierProvider<ActivityMapNotifier, Map<int, Activity>>((ref) {
  final activities = ref.watch( activitiesProvider );
  return ActivityMapNotifier(activities: activities );
});


class ActivityMapNotifier extends StateNotifier<Map<int,Activity>> {
  final List<Activity> activities;
  ActivityMapNotifier({
    required this.activities,
  }): super({});


  Future<void> loadActivity( int activityID ) async {
    if ( state[activityID] != null ) return;
    final activity = activities.firstWhere((a) => a.id == activityID);
    await Future.delayed(const Duration(seconds: 1));
    state = { ...state, activityID: activity };
  }

}