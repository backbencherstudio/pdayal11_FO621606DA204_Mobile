import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/add_task_model.dart';
import '../models/hibi_model.dart';

final completedTaskListProvider =
StateNotifierProvider<CompletedTaskListNotifier, List<TaskModel>>(
      (ref) => CompletedTaskListNotifier(),
);

class CompletedTaskListNotifier extends StateNotifier<List<TaskModel>> {
  CompletedTaskListNotifier() : super([]);

  // Add a task to the completed task list
  void add(TaskModel task) {
    state = [...state, task];
  }

  // Filter tasks by chapterId
  List<TaskModel> getTasksByChapterId(String chapterId) {
    // Use the where() method to filter tasks by chapterId
    final filteredTasks = state.where((task) => task.chapterId == chapterId).toList();
    return filteredTasks;
  }
}
