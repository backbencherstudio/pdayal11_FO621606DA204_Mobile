import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/add_task_model.dart';

final completedTaskListProvider =
    StateNotifierProvider<CompletedTaskListNotifier, List<TaskModel>>(
      (ref) => CompletedTaskListNotifier(),
    );

class CompletedTaskListNotifier extends StateNotifier<List<TaskModel>> {
  CompletedTaskListNotifier() : super([]);

  void add(TaskModel task) {
    state = [...state, task];
  }
}
