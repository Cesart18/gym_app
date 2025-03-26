import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    final int idPersona;
    final String nombre;
    final String apellidos;
    final String dni;

    UserModel({
        required this.idPersona,
        required this.nombre,
        required this.apellidos,
        required this.dni,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idPersona: json["idPersona"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        dni: json["DNI"],
    );

    Map<String, dynamic> toJson() => {
        "idPersona": idPersona,
        "nombre": nombre,
        "apellidos": apellidos,
        "DNI": dni,
    };
}
