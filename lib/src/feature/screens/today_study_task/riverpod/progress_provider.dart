import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/pending_task_provider.dart';

import 'completed_task_list_provider.dart';

final progressProvider = StateProvider<double>((ref) {
  final pendingTasks = ref.watch(pendingTaskListProvider);
  final completedTasks = ref.watch(completedTaskListProvider);

  final totalTasks = pendingTasks.length + completedTasks.length;
  final completedTaskCount = completedTasks.length;

  return totalTasks == 0 ? 0.0 : completedTaskCount / totalTasks;
});
