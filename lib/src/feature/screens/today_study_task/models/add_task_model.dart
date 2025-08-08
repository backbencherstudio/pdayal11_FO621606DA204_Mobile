class TaskModel {
  final String title;
  final String date;


  TaskModel({required this.title, required this.date});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel &&
        other.title == title &&
        other.date == date;
  }

  @override
  int get hashCode => title.hashCode ^ date.hashCode;
}
