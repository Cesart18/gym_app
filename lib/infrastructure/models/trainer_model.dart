import 'dart:convert';

List<TrainerModel> trainerModelFromJson(String str) => List<TrainerModel>.from(json.decode(str).map((x) => TrainerModel.fromJson(x)));

String trainerModelToJson(List<TrainerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrainerModel {
    final int idTrainer;
    final String nombre;
    final String apellidos;
    final String dni;
    final String cv;
    final List<int> actividades;

    TrainerModel({
        required this.idTrainer,
        required this.nombre,
        required this.apellidos,
        required this.dni,
        required this.cv,
        required this.actividades,
    });

    factory TrainerModel.fromJson(Map<String, dynamic> json) => TrainerModel(
        idTrainer: json["idTrainer"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        dni: json["DNI"],
        cv: json["cv"],
        actividades: List<int>.from(json["actividades"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "idTrainer": idTrainer,
        "nombre": nombre,
        "apellidos": apellidos,
        "DNI": dni,
        "cv": cv,
        "actividades": List<dynamic>.from(actividades.map((x) => x)),
    };
}
