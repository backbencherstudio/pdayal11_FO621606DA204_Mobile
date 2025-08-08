class TaskModel {
  final String title;
  final String date;
  final String difficulty;

  TaskModel({
    required this.title,
    required this.date,
    required this.difficulty,
  });

  @override
  bool operator ==(Object other) {
    return other is TaskModel &&
        other.title == title &&
        other.date == date;
  }

  @override
  int get hashCode => title.hashCode ^ date.hashCode;
}
