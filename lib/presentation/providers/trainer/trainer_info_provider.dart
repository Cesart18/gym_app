import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/domain/entities/trainer.dart';
import 'package:gym_app/domain/repositories/trainer_repository.dart';
import 'package:gym_app/infrastructure/errors/custom_error.dart';
import 'package:gym_app/presentation/providers/global_message_provider.dart';
import 'package:gym_app/presentation/providers/trainer/trainer_repository_provider.dart';

final trainerInfoProvider = StateNotifierProvider<TrainerMapNotifier, Map<int, Trainer>>((ref) {
  final trainerRepository = ref.watch( trainerRepositoryProvider );
  final messageNotifier = ref.watch(globalMessageProvider.notifier);
  return TrainerMapNotifier(repository: trainerRepository, messageNotifier: messageNotifier );
});


class TrainerMapNotifier extends StateNotifier<Map<int,Trainer>> {
  final TrainerRepository repository;
  final GlobalMessageNotifier messageNotifier;
  TrainerMapNotifier({
    required this.repository,
    required this.messageNotifier,
  }): super({});


  Future<void> loadTrainer( int trainerID ) async {
    try {
      if ( state[trainerID] != null ) return;
      final trainer = await repository.getTrainerByID(trainerID);
      await Future.delayed(const Duration(seconds: 1));
      state = { ...state, trainerID: trainer };
    } on CustomError catch (e) {
      messageNotifier.setErrorMessage(e.message ?? 'Error no controlado');
    }
  }

}