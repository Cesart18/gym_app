import 'package:gym_app/domain/entities/user.dart';
import 'package:gym_app/infrastructure/models/user_model.dart';

class UserMapper {
  static User modelToEntity( UserModel user ) => User(
      id: user.idPersona, 
      firstName: user.nombre, 
      lastName: user.apellidos, 
      dni: user.dni);
}
