import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/add_task_model.dart';

final showPendingTasks = StateProvider<int>((ref) => 0);
class PendingTaskListNotifier extends StateNotifier<List<TaskModel>> {
  PendingTaskListNotifier() : super([]);

  void add(TaskModel tasksModel) {
    state = [...state, tasksModel];
  }
}

final pendingTaskListProvider = StateNotifierProvider<PendingTaskListNotifier, List<TaskModel>>(
      (ref) => PendingTaskListNotifier(),
);
