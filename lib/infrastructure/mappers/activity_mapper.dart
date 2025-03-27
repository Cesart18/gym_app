import 'package:gym_app/domain/entities/activity.dart';
import 'package:gym_app/infrastructure/models/activity_model.dart';

class ActivityMapper {
  static Activity modelToEntity(ActivityModel activity) => Activity(
    id: activity.idActividadColectiva,
    name: activity.nombreActividadColectiva,
    description: activity.descripcion,
    imageURL: 'assets/${activity.imagen}',
    trainerID: activity.entrenadorResponsable,
    users: activity.sociosInscritos,
    daySchedule: activity.diaClase,
    hourSchedule: activity.horaClase,
  );
}
