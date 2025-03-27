class Activity {
  final int id;
  final String name;
  final String description;
  final String imageURL;
  final int trainerID;
  final List<int> users;
  final String daySchedule;
  final String hourSchedule;

  Activity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.trainerID,
    required this.users,
    required this.daySchedule,
    required this.hourSchedule,
  });

  Activity copyWith({
    int? id,
    String? name,
    String? description,
    String? imageURL,
    int? trainerID,
    List<int>? users,
    String? daySchedule,
    String? hourSchedule,
  }) {
    return Activity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageURL: imageURL ?? this.imageURL,
      trainerID: trainerID ?? this.trainerID,
      users: users ?? this.users,
      daySchedule: daySchedule ?? this.daySchedule,
      hourSchedule: hourSchedule ?? this.hourSchedule,
    );
  }
}
