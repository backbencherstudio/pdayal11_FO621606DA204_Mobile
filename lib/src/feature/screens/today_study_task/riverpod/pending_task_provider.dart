import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/add_task_model.dart';

class PendingTaskListNotifier extends StateNotifier<List<TaskModel>> {
  PendingTaskListNotifier() : super([]);

  void add(TaskModel task) {
    state = [...state, task];
  }

  void remove(TaskModel task) {
    state = state.where((t) =>
    t.title != task.title ||
        t.date != task.date ||
        t.difficulty != task.difficulty ||
        t.chapterID != task.chapterID
    ).toList();
    debugPrint("Task to remove: ${task.title}, ${task.date}, ${task.difficulty}");
  }

  List<TaskModel> getTasksByChapter(String chapterId) {
    return state.where((task) => task.chapterID == chapterId).toList();
  }
}

final pendingTaskListProvider =
StateNotifierProvider<PendingTaskListNotifier, List<TaskModel>>(
      (ref) => PendingTaskListNotifier(),
);
