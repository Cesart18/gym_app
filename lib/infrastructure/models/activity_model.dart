import 'dart:convert';

List<ActivityModel> activityModelFromJson(String str) => List<ActivityModel>.from(json.decode(str).map((x) => ActivityModel.fromJson(x)));

String activityModelToJson(List<ActivityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityModel {
    final int idActividadColectiva;
    final String nombreActividadColectiva;
    final String descripcion;
    final String imagen;
    final int entrenadorResponsable;
    final List<int> sociosInscritos;
    final String diaClase;
    final String horaClase;

    ActivityModel({
        required this.idActividadColectiva,
        required this.nombreActividadColectiva,
        required this.descripcion,
        required this.imagen,
        required this.entrenadorResponsable,
        required this.sociosInscritos,
        required this.diaClase,
        required this.horaClase,
    });

    factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        idActividadColectiva: json["idActividadColectiva"],
        nombreActividadColectiva: json["nombreActividadColectiva"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        entrenadorResponsable: json["entrenadorResponsable"],
        sociosInscritos: List<int>.from(json["sociosInscritos"].map((x) => x)),
        diaClase: json["diaClase"],
        horaClase: json["horaClase"],
    );

    Map<String, dynamic> toJson() => {
        "idActividadColectiva": idActividadColectiva,
        "nombreActividadColectiva": nombreActividadColectiva,
        "descripcion": descripcion,
        "imagen": imagen,
        "entrenadorResponsable": entrenadorResponsable,
        "sociosInscritos": List<dynamic>.from(sociosInscritos.map((x) => x)),
        "diaClase": diaClase,
        "horaClase": horaClase,
    };
}
