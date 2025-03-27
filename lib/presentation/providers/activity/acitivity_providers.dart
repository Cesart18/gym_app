import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gym_app/domain/entities/activity.dart';
import 'package:gym_app/domain/repositories/activity_repository.dart';
import 'package:gym_app/infrastructure/errors/custom_error.dart';
import 'package:gym_app/presentation/providers/activity/activity_repository_provider.dart';
import 'package:gym_app/presentation/providers/global_message_provider.dart';

final userActivitiesProvider = Provider.family<List<Activity>, int>((ref, userID) {
  final activities = ref.watch(activitiesProvider);
  return activities.where((a) => a.users.contains(userID)).toList();
});

final activitiesProvider = StateNotifierProvider<ActivityNotifier, List<Activity>>((ref) {
  final repository = ref.watch(activityRepositoryProvider);
  final messageNotifier = ref.watch(globalMessageProvider.notifier);
  return ActivityNotifier(repository: repository, messageNotifier: messageNotifier);
});

class ActivityNotifier extends StateNotifier<List<Activity>> {
  final ActivityRepository repository;
  final GlobalMessageNotifier messageNotifier;
  ActivityNotifier({
    required this.repository,
    required this.messageNotifier,
  }): super([]){
    fetchActivities();
  }
  
  Future<void> fetchActivities() async {
    try {
      final activities = await repository.getGymActivities();
      state = activities;
    } on CustomError catch (e) {
      messageNotifier.setErrorMessage(e.message ?? 'error no controlado');
    }
  }

  void deleteSuscription(int activityId, int userId) {
    final index = state.indexWhere((activity) => activity.id == activityId);

    if (index == -1) {
      messageNotifier.setErrorMessage('Actividad no encontrada');
      return;
    }

    final currentActivity = state[index];

    if (!currentActivity.users.contains(userId)) {
      messageNotifier.setErrorMessage('El usuario no está inscrito en esta actividad');
      return;
    }

    final updatedActivity = currentActivity.copyWith(
      users: currentActivity.users.where((id) => id != userId).toList(),
    );
    
    messageNotifier.setSuccessMessage('Suscripción eliminada correctamente');

    state = [
      ...state.sublist(0, index), 
      updatedActivity,           
      ...state.sublist(index + 1),
    ];
  }

  void addSuscription(int activityId, int userId) {
    final index = state.indexWhere((activity) => activity.id == activityId);

    if (index == -1) {
      messageNotifier.setErrorMessage('Actividad no encontrada');
      return;
    }

    final currentActivity = state[index];

    if (currentActivity.users.contains(userId)) {
      messageNotifier.setErrorMessage('El usuario está inscrito en esta actividad');
      return;
    }

    final updatedActivity = currentActivity.copyWith(
      users: [...currentActivity.users, userId]
    );

    messageNotifier.setSuccessMessage('Suscripción agregada correctamente');

    state = [
      ...state.sublist(0, index), 
      updatedActivity,           
      ...state.sublist(index + 1),
    ];
  }


}


