import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/add_task_model.dart';
import '../models/hibi_model.dart';

final showPendingTasks = StateProvider<int>((ref) => 0);

class PendingTaskListNotifier extends StateNotifier<List<TaskModel>> {
  PendingTaskListNotifier() : super([]);

  // Add a task
  void add(TaskModel task) {
    // Filter existing tasks by chapterId
    final filteredTasks = state.where((t) => t.chapterId == task.chapterId).toList();

    // Check if the task with the same chapterId, title, and date already exists
    if (!filteredTasks.any((t) => t.title == task.title && t.date == task.date)) {
      // Add the new task if not already added for the same chapterId
      state = [...state, task];
    } else {
      debugPrint("Duplicate task not added: ${task.title} for chapter ${task.chapterId}");
    }
  }

  TaskModel getTaskById(String taskId) {
    // Look for the task in the state list by taskId
    final task = state.firstWhere(
          (t) => t.taskId == taskId,
      orElse: () => throw Exception("Task with taskId $taskId not found."),
    );
    return task;
  }

  // Remove a task
  void removeById(TaskModel task) {
    state = state.where((t) => t != task).toList();
  }
}

final pendingTaskListProvider = StateNotifierProvider<PendingTaskListNotifier, List<TaskModel>>(
      (ref) => PendingTaskListNotifier(),
);
