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
}
