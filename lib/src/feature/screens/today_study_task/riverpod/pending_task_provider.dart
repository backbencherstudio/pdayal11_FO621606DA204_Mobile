import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/add_task_model.dart';

final showPendingTasks = StateProvider<int>((ref) => 0);

class PendingTaskListNotifier extends StateNotifier<List<TaskModel>> {
  PendingTaskListNotifier() : super([]);

  void add(TaskModel task) {
    final filteredTasks =
        state.where((t) => t.chapterId == task.chapterId).toList();

    if (!filteredTasks.any(
      (t) => t.title == task.title && t.date == task.date,
    )) {
      state = [...state, task];
    } else {
      debugPrint(
        "Duplicate task not added: ${task.title} for chapter ${task.chapterId}",
      );
    }
  }
  TaskModel getTaskById(String taskId) {
    final task = state.firstWhere(
      (t) => t.taskId == taskId,
      orElse: () => throw Exception("Task with taskId $taskId not found."),
    );
    return task;
  }

  void removeById(TaskModel task) {
    state = state.where((t) => t != task).toList();
  }
}

final pendingTaskListProvider =
    StateNotifierProvider<PendingTaskListNotifier, List<TaskModel>>(
      (ref) => PendingTaskListNotifier(),
    );
