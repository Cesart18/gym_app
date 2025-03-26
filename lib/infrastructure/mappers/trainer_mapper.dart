import 'package:gym_app/domain/entities/trainer.dart';
import 'package:gym_app/infrastructure/models/trainer_model.dart';

class TrainerMapper {
  static Trainer modelToEntity(TrainerModel trainer) => Trainer(
    id: trainer.idTrainer,
    firstName: trainer.nombre,
    lastName: trainer.apellidos,
    dni: trainer.dni,
    resume: trainer.cv,
    activities: trainer.actividades,
  );
}
