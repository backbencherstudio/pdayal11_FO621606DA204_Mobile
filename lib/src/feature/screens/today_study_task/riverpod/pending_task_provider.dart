import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/add_task_model.dart';

class PendingTaskListNotifier extends StateNotifier<List<TaskModel>> {
  PendingTaskListNotifier() : super([]);

  void add(TaskModel task) {
    state = [...state, task];
  }

  void remove(TaskModel task) {
    // Remove the task from the list if it matches the task provided
    state = state.where((t) => t != task).toList();
  }

  // Fetch tasks related to a specific chapterId
  List<TaskModel> getTasksByChapter(String chapterId) {
    return state.where((task) => task.chapterID == chapterId).toList();
  }
}

final pendingTaskListProvider =
StateNotifierProvider<PendingTaskListNotifier, List<TaskModel>>(
      (ref) => PendingTaskListNotifier(),
);
