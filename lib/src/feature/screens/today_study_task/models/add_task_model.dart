class TaskModel {
  final String chapterId;
  final String title;
  final String date;
  final String difficulty;
  final String taskId;

  TaskModel({
    required this.chapterId,
    required this.title,
    required this.date,
    required this.difficulty,
    required this.taskId,
  });

  @override
  bool operator ==(Object other) {
    return other is TaskModel &&
        other.title == title &&
        other.date == date &&
        other.difficulty == difficulty &&
        other.chapterId == chapterId;
  }

  @override
  int get hashCode => chapterId.hashCode ^ title.hashCode ^ date.hashCode;
}
