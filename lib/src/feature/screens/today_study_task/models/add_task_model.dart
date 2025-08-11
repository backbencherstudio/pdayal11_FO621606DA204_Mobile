class TaskModel {
  final String title;
  final String date;
  final String difficulty;
  final String chapterID;

  TaskModel({
    required this.title,
    required this.date,
    required this.difficulty,
    required this.chapterID
  });

  @override
  bool operator ==(Object other) {
    return other is TaskModel &&
        other.title == title &&
        other.date == date &&
        other.difficulty == difficulty &&
        other.chapterID == chapterID;
  }

  @override
  int get hashCode => title.hashCode ^ date.hashCode ^ difficulty.hashCode ^ chapterID.hashCode;
}
